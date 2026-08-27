# A bare host on purpose: no user_data, no packages, no application. Terraform
# installing software mixes the same responsibilities as provisioner
# "remote-exec" -- everything inside the instance belongs to Ansible.

data "aws_ssm_parameter" "ami" {
  name = var.ami_parameter_name
}

resource "aws_security_group" "this" {
  # name_prefix (not name) is required by create_before_destroy below: a
  # security group name is unique per VPC, so the replacement could not be
  # created while the old one still holds a fixed name.
  name_prefix = "${var.name_prefix}-host-"
  description = "Allow SSH and application traffic"
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-host-sg"
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
    Name = "${var.name_prefix}-host-sg-ssh"
  })
}

resource "aws_vpc_security_group_ingress_rule" "app" {
  description       = "Allow application traffic from anywhere"
  security_group_id = aws_security_group.this.id
  from_port         = var.app_port
  to_port           = var.app_port
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-host-sg-app"
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
    Name = "${var.name_prefix}-host-sg-egress"
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
    Name = "${var.name_prefix}-host-instance"
    Role = "docker-host"
  })
}
