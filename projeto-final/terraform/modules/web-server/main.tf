data "aws_ssm_parameter" "ami" {
  name = var.ami_parameter_name
}

locals {
  # Rendered in two stages so the page stays in a real .html file: content
  # first, then embedded into the boot script. path.module keeps the lookup
  # relative to the module, not to whoever calls it.
  page_html = templatefile("${path.module}/templates/index.html.tftpl", {
    stack_items    = var.stack_items
    page_title     = var.page_title
    page_subtitle  = var.page_subtitle
    student_name   = var.student_name
    class_name     = var.class_name
    course_name    = var.course_name
    professor_name = var.professor_name
    environment    = var.environment
  })

  user_data = templatefile("${path.module}/templates/user_data.sh.tftpl", {
    page_html = local.page_html

    # The boot script needs the port too, not just the security group: the
    # firewall and the listening socket are two surfaces that have to agree.
    http_port = var.http_port
  })
}

resource "aws_security_group" "this" {
  # name_prefix (not name) is required by create_before_destroy below: a
  # security group name is unique per VPC, so the replacement could not be
  # created while the old one still holds a fixed name.
  name_prefix = "${var.name_prefix}-web-"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web-sg"
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  description       = "Allow SSH traffic from your public IP"
  security_group_id = aws_security_group.this.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.ssh_ingress_cidr

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web-sg-ssh"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  description       = "Allow HTTP traffic from anywhere"
  security_group_id = aws_security_group.this.id
  from_port         = var.http_port
  to_port           = var.http_port
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web-sg-http"
  })
}

resource "aws_vpc_security_group_egress_rule" "all" {
  description       = "Allow all outbound traffic"
  security_group_id = aws_security_group.this.id

  # from_port/to_port are deliberately omitted: with ip_protocol = "-1" the
  # API already means "all protocols, all ports", and passing them errors.
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web-sg-egress"
  })
}

resource "aws_instance" "this" {
  # insecure_value, not value: .value is marked sensitive even for public
  # parameters, which would hide the AMI ID in the plan used as evidence.
  ami                         = data.aws_ssm_parameter.ami.insecure_value
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = local.user_data
  user_data_replace_on_change = true

  # IMDSv2 required: IMDSv1 allows instance credential theft via SSRF.
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 8
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web-instance"
  })
}
