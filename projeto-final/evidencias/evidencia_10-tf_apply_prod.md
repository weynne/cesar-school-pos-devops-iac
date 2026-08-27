module.docker_host.data.aws_ssm_parameter.ami: Reading...
module.network.data.aws_availability_zones.available: Reading...
module.network.data.aws_availability_zones.available: Read complete after 1s [id=us-east-1]
module.docker_host.data.aws_ssm_parameter.ami: Read complete after 1s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_key_pair.this will be created
  + resource "aws_key_pair" "this" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "projeto-final-pos-devops-iac-prod-key"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII0c4MVczGMRqq7EPoJkIiHPWZXgdAD8bDKXE8yMaaI8 projeto-final-iac"
      + region          = "us-east-1"
      + tags_all        = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
    }

  # terraform_data.workspace_guard will be created
  + resource "terraform_data" "workspace_guard" {
      + id = (known after apply)
    }

  # module.docker_host.aws_instance.this will be created
  + resource "aws_instance" "this" {
      + ami                                  = "ami-0332d564d76dbd8d6"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "projeto-final-pos-devops-iac-prod-key"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "projeto-final-pos-devops-iac-prod-host-instance"
          + "Role" = "docker-host"
        }
      + tags_all                             = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-host-instance"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
          + "Role"        = "docker-host"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 8
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.docker_host.aws_security_group.this will be created
  + resource "aws_security_group" "this" {
      + arn                    = (known after apply)
      + description            = "Allow SSH and application traffic"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "projeto-final-pos-devops-iac-prod-host-"
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "projeto-final-pos-devops-iac-prod-host-sg"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-host-sg"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
      + vpc_id                 = (known after apply)
    }

  # module.docker_host.aws_vpc_security_group_egress_rule.all will be created
  + resource "aws_vpc_security_group_egress_rule" "all" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow all outbound traffic"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags                   = {
          + "Name" = "projeto-final-pos-devops-iac-prod-host-sg-egress"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-host-sg-egress"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
    }

  # module.docker_host.aws_vpc_security_group_ingress_rule.app will be created
  + resource "aws_vpc_security_group_ingress_rule" "app" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow application traffic from anywhere"
      + from_port              = 3000
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags                   = {
          + "Name" = "projeto-final-pos-devops-iac-prod-host-sg-app"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-host-sg-app"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
      + to_port                = 3000
    }

  # module.docker_host.aws_vpc_security_group_ingress_rule.ssh will be created
  + resource "aws_vpc_security_group_ingress_rule" "ssh" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "203.0.113.42/32"
      + description            = "Allow SSH traffic from your public IP"
      + from_port              = 22
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags                   = {
          + "Name" = "projeto-final-pos-devops-iac-prod-host-sg-ssh"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-host-sg-ssh"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
      + to_port                = 22
    }

  # module.network.aws_internet_gateway.this will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + region   = "us-east-1"
      + tags     = {
          + "Name" = "projeto-final-pos-devops-iac-prod-igw"
        }
      + tags_all = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-igw"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
      + vpc_id   = (known after apply)
    }

  # module.network.aws_route.public_internet_access will be created
  + resource "aws_route" "public_internet_access" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + region                 = "us-east-1"
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.network.aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = (known after apply)
      + tags             = {
          + "Name" = "projeto-final-pos-devops-iac-prod-public-rt"
        }
      + tags_all         = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-public-rt"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
      + vpc_id           = (known after apply)
    }

  # module.network.aws_route_table_association.public will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.network.aws_subnet.public will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.0.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Name" = "projeto-final-pos-devops-iac-prod-public-subnet"
        }
      + tags_all                                       = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-public-subnet"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.network.aws_vpc.this will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.20.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + region                               = "us-east-1"
      + tags                                 = {
          + "Name" = "projeto-final-pos-devops-iac-prod-vpc"
        }
      + tags_all                             = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "projeto-final-pos-devops-iac-prod-vpc"
          + "Owner"       = "Weynne Guimarães"
          + "Project"     = "projeto-final-pos-devops-iac"
        }
    }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + app_url             = (known after apply)
  + app_url_dns         = (known after apply)
  + instance_public_dns = (known after apply)
  + instance_public_ip  = (known after apply)
  + instance_type       = "t3.micro"
  + ssh_command         = (known after apply)
  + workspace           = "prod"
terraform_data.workspace_guard: Creating...
terraform_data.workspace_guard: Creation complete after 0s [id=9232213c-e1bc-129a-88cd-7512159811c0]
aws_key_pair.this: Creating...
module.network.aws_vpc.this: Creating...
aws_key_pair.this: Creation complete after 1s [id=projeto-final-pos-devops-iac-prod-key]
module.network.aws_vpc.this: Creation complete after 3s [id=vpc-013bbbd7101615e90]
module.network.aws_internet_gateway.this: Creating...
module.network.aws_route_table.public: Creating...
module.network.aws_subnet.public: Creating...
module.docker_host.aws_security_group.this: Creating...
module.network.aws_internet_gateway.this: Creation complete after 1s [id=igw-019f0783984220733]
module.network.aws_route_table.public: Creation complete after 1s [id=rtb-0ec0267c75d622875]
module.network.aws_route.public_internet_access: Creating...
module.network.aws_route.public_internet_access: Creation complete after 2s [id=r-rtb-0ec0267c75d6228751080289494]
module.docker_host.aws_security_group.this: Creation complete after 3s [id=sg-0a28bd879f288b26d]
module.docker_host.aws_vpc_security_group_egress_rule.all: Creating...
module.docker_host.aws_vpc_security_group_ingress_rule.app: Creating...
module.docker_host.aws_vpc_security_group_ingress_rule.ssh: Creating...
module.docker_host.aws_vpc_security_group_egress_rule.all: Creation complete after 1s [id=sgr-09c53e721d0bb21e4]
module.docker_host.aws_vpc_security_group_ingress_rule.ssh: Creation complete after 1s [id=sgr-0007c0d155c89754c]
module.docker_host.aws_vpc_security_group_ingress_rule.app: Creation complete after 1s [id=sgr-098bb1ac91031f402]
module.network.aws_subnet.public: Still creating... [00m10s elapsed]
module.network.aws_subnet.public: Creation complete after 12s [id=subnet-0b58934fa688d3d19]
module.network.aws_route_table_association.public: Creating...
module.docker_host.aws_instance.this: Creating...
module.network.aws_route_table_association.public: Creation complete after 1s [id=rtbassoc-0476fd62be067ff09]
module.docker_host.aws_instance.this: Still creating... [00m10s elapsed]
module.docker_host.aws_instance.this: Still creating... [00m20s elapsed]
module.docker_host.aws_instance.this: Creation complete after 24s [id=i-074c111f6ec39294c]
Releasing state lock. This may take a few moments...

Apply complete! Resources: 13 added, 0 changed, 0 destroyed.

Outputs:

app_url = "http://54.204.118.28:3000"
app_url_dns = "http://ec2-54-204-118-28.compute-1.amazonaws.com:3000"
instance_public_dns = "ec2-54-204-118-28.compute-1.amazonaws.com"
instance_public_ip = "54.204.118.28"
instance_type = "t3.micro"
ssh_command = "ssh -i ~/.ssh/projeto-final ec2-user@54.204.118.28"
workspace = "prod"
