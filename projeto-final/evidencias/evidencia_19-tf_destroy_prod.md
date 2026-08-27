Acquiring state lock. This may take a few moments...
terraform_data.workspace_guard: Refreshing state... [id=9232213c-e1bc-129a-88cd-7512159811c0]
module.docker_host.data.aws_ssm_parameter.ami: Reading...
aws_key_pair.this: Refreshing state... [id=projeto-final-pos-devops-iac-prod-key]
module.network.data.aws_availability_zones.available: Reading...
module.network.aws_vpc.this: Refreshing state... [id=vpc-013bbbd7101615e90]
module.network.data.aws_availability_zones.available: Read complete after 1s [id=us-east-1]
module.docker_host.data.aws_ssm_parameter.ami: Read complete after 2s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]
module.network.aws_internet_gateway.this: Refreshing state... [id=igw-019f0783984220733]
module.network.aws_route_table.public: Refreshing state... [id=rtb-0ec0267c75d622875]
module.network.aws_subnet.public: Refreshing state... [id=subnet-0b58934fa688d3d19]
module.docker_host.aws_security_group.this: Refreshing state... [id=sg-0a28bd879f288b26d]
module.network.aws_route_table_association.public: Refreshing state... [id=rtbassoc-0476fd62be067ff09]
module.docker_host.aws_vpc_security_group_ingress_rule.app: Refreshing state... [id=sgr-098bb1ac91031f402]
module.docker_host.aws_vpc_security_group_egress_rule.all: Refreshing state... [id=sgr-09c53e721d0bb21e4]
module.docker_host.aws_vpc_security_group_ingress_rule.ssh: Refreshing state... [id=sgr-0007c0d155c89754c]
module.docker_host.aws_instance.this: Refreshing state... [id=i-074c111f6ec39294c]
module.network.aws_route.public_internet_access: Refreshing state... [id=r-rtb-0ec0267c75d6228751080289494]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_key_pair.this will be destroyed
  - resource "aws_key_pair" "this" {
      - arn             = "arn:aws:ec2:us-east-1:123456789012:key-pair/projeto-final-pos-devops-iac-prod-key" -> null
      - fingerprint     = "TNRR3W6oaG4wpuL1EW35chlTyknRzEn/ymzkeAKTN0w=" -> null
      - id              = "projeto-final-pos-devops-iac-prod-key" -> null
      - key_name        = "projeto-final-pos-devops-iac-prod-key" -> null
      - key_pair_id     = "key-00336282d8e204965" -> null
      - key_type        = "ed25519" -> null
      - public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII0c4MVczGMRqq7EPoJkIiHPWZXgdAD8bDKXE8yMaaI8 projeto-final-iac" -> null
      - region          = "us-east-1" -> null
      - tags            = {} -> null
      - tags_all        = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
        # (1 unchanged attribute hidden)
    }

  # terraform_data.workspace_guard will be destroyed
  - resource "terraform_data" "workspace_guard" {
      - id = "9232213c-e1bc-129a-88cd-7512159811c0" -> null
    }

  # module.docker_host.aws_instance.this will be destroyed
  - resource "aws_instance" "this" {
      - ami                                  = "ami-0332d564d76dbd8d6" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:123456789012:instance/i-074c111f6ec39294c" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - force_destroy                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-074c111f6ec39294c" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "projeto-final-pos-devops-iac-prod-key" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0b562bcf7627e542f" -> null
      - private_dns                          = "ip-10-20-0-54.ec2.internal" -> null
      - private_ip                           = "10.20.0.54" -> null
      - public_dns                           = "ec2-54-204-118-28.compute-1.amazonaws.com" -> null
      - public_ip                            = "54.204.118.28" -> null
      - region                               = "us-east-1" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0b58934fa688d3d19" -> null
      - tags                                 = {
          - "Name" = "projeto-final-pos-devops-iac-prod-host-instance"
          - "Role" = "docker-host"
        } -> null
      - tags_all                             = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-host-instance"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
          - "Role"        = "docker-host"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0a28bd879f288b26d",
        ] -> null
        # (8 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count            = 1 -> null
          - threads_per_core      = 2 -> null
            # (2 unchanged attributes hidden)
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 2 -> null
          - http_tokens                 = "required" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - primary_network_interface {
          - delete_on_termination = true -> null
          - network_interface_id  = "eni-0b562bcf7627e542f" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = true -> null
          - iops                  = 3000 -> null
          - kms_key_id            = "arn:aws:kms:us-east-1:123456789012:key/674308e4-1efd-4644-b347-337d9757f984" -> null
          - tags                  = {} -> null
          - tags_all              = {
              - "Environment" = "prod"
              - "ManagedBy"   = "Terraform"
              - "Owner"       = "Weynne Guimarães"
              - "Project"     = "projeto-final-pos-devops-iac"
            } -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-0656f618f7d5e09d7" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # module.docker_host.aws_security_group.this will be destroyed
  - resource "aws_security_group" "this" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group/sg-0a28bd879f288b26d" -> null
      - description            = "Allow SSH and application traffic" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow all outbound traffic"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0a28bd879f288b26d" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow application traffic from anywhere"
              - from_port        = 3000
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 3000
            },
          - {
              - cidr_blocks      = [
                  - "203.0.113.42/32",
                ]
              - description      = "Allow SSH traffic from your public IP"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
        ] -> null
      - name                   = "projeto-final-pos-devops-iac-prod-host-fab70287d011d1eede8e232b88" -> null
      - name_prefix            = "projeto-final-pos-devops-iac-prod-host-" -> null
      - owner_id               = "123456789012" -> null
      - region                 = "us-east-1" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Name" = "projeto-final-pos-devops-iac-prod-host-sg"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-host-sg"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
      - vpc_id                 = "vpc-013bbbd7101615e90" -> null
    }

  # module.docker_host.aws_vpc_security_group_egress_rule.all will be destroyed
  - resource "aws_vpc_security_group_egress_rule" "all" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group-rule/sgr-09c53e721d0bb21e4" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - description            = "Allow all outbound traffic" -> null
      - id                     = "sgr-09c53e721d0bb21e4" -> null
      - ip_protocol            = "-1" -> null
      - region                 = "us-east-1" -> null
      - security_group_id      = "sg-0a28bd879f288b26d" -> null
      - security_group_rule_id = "sgr-09c53e721d0bb21e4" -> null
      - tags                   = {
          - "Name" = "projeto-final-pos-devops-iac-prod-host-sg-egress"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-host-sg-egress"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
    }

  # module.docker_host.aws_vpc_security_group_ingress_rule.app will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "app" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group-rule/sgr-098bb1ac91031f402" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - description            = "Allow application traffic from anywhere" -> null
      - from_port              = 3000 -> null
      - id                     = "sgr-098bb1ac91031f402" -> null
      - ip_protocol            = "tcp" -> null
      - region                 = "us-east-1" -> null
      - security_group_id      = "sg-0a28bd879f288b26d" -> null
      - security_group_rule_id = "sgr-098bb1ac91031f402" -> null
      - tags                   = {
          - "Name" = "projeto-final-pos-devops-iac-prod-host-sg-app"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-host-sg-app"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
      - to_port                = 3000 -> null
    }

  # module.docker_host.aws_vpc_security_group_ingress_rule.ssh will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "ssh" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group-rule/sgr-0007c0d155c89754c" -> null
      - cidr_ipv4              = "203.0.113.42/32" -> null
      - description            = "Allow SSH traffic from your public IP" -> null
      - from_port              = 22 -> null
      - id                     = "sgr-0007c0d155c89754c" -> null
      - ip_protocol            = "tcp" -> null
      - region                 = "us-east-1" -> null
      - security_group_id      = "sg-0a28bd879f288b26d" -> null
      - security_group_rule_id = "sgr-0007c0d155c89754c" -> null
      - tags                   = {
          - "Name" = "projeto-final-pos-devops-iac-prod-host-sg-ssh"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-host-sg-ssh"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
      - to_port                = 22 -> null
    }

  # module.network.aws_internet_gateway.this will be destroyed
  - resource "aws_internet_gateway" "this" {
      - arn      = "arn:aws:ec2:us-east-1:123456789012:internet-gateway/igw-019f0783984220733" -> null
      - id       = "igw-019f0783984220733" -> null
      - owner_id = "123456789012" -> null
      - region   = "us-east-1" -> null
      - tags     = {
          - "Name" = "projeto-final-pos-devops-iac-prod-igw"
        } -> null
      - tags_all = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-igw"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
      - vpc_id   = "vpc-013bbbd7101615e90" -> null
    }

  # module.network.aws_route.public_internet_access will be destroyed
  - resource "aws_route" "public_internet_access" {
      - destination_cidr_block      = "0.0.0.0/0" -> null
      - gateway_id                  = "igw-019f0783984220733" -> null
      - id                          = "r-rtb-0ec0267c75d6228751080289494" -> null
      - origin                      = "CreateRoute" -> null
      - region                      = "us-east-1" -> null
      - route_table_id              = "rtb-0ec0267c75d622875" -> null
      - state                       = "active" -> null
        # (14 unchanged attributes hidden)
    }

  # module.network.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:us-east-1:123456789012:route-table/rtb-0ec0267c75d622875" -> null
      - id               = "rtb-0ec0267c75d622875" -> null
      - owner_id         = "123456789012" -> null
      - propagating_vgws = [] -> null
      - region           = "us-east-1" -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-019f0783984220733"
                # (12 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Name" = "projeto-final-pos-devops-iac-prod-public-rt"
        } -> null
      - tags_all         = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-public-rt"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
      - vpc_id           = "vpc-013bbbd7101615e90" -> null
    }

  # module.network.aws_route_table_association.public will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0476fd62be067ff09" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-0ec0267c75d622875" -> null
      - subnet_id      = "subnet-0b58934fa688d3d19" -> null
        # (1 unchanged attribute hidden)
    }

  # module.network.aws_subnet.public will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-0b58934fa688d3d19" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.20.0.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0b58934fa688d3d19" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "123456789012" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - region                                         = "us-east-1" -> null
      - tags                                           = {
          - "Name" = "projeto-final-pos-devops-iac-prod-public-subnet"
        } -> null
      - tags_all                                       = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-public-subnet"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
      - vpc_id                                         = "vpc-013bbbd7101615e90" -> null
        # (4 unchanged attributes hidden)
    }

  # module.network.aws_vpc.this will be destroyed
  - resource "aws_vpc" "this" {
      - arn                                  = "arn:aws:ec2:us-east-1:123456789012:vpc/vpc-013bbbd7101615e90" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.20.0.0/16" -> null
      - default_network_acl_id               = "acl-026d265f873364aa1" -> null
      - default_route_table_id               = "rtb-0c3924de9e9c74c50" -> null
      - default_security_group_id            = "sg-0164ff8a49e731e2d" -> null
      - dhcp_options_id                      = "dopt-0ffab6739ea05d548" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-013bbbd7101615e90" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-0c3924de9e9c74c50" -> null
      - owner_id                             = "123456789012" -> null
      - region                               = "us-east-1" -> null
      - tags                                 = {
          - "Name" = "projeto-final-pos-devops-iac-prod-vpc"
        } -> null
      - tags_all                             = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "projeto-final-pos-devops-iac-prod-vpc"
          - "Owner"       = "Weynne Guimarães"
          - "Project"     = "projeto-final-pos-devops-iac"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 13 to destroy.

Changes to Outputs:
  - app_url             = "http://54.204.118.28:3000" -> null
  - app_url_dns         = "http://ec2-54-204-118-28.compute-1.amazonaws.com:3000" -> null
  - instance_public_dns = "ec2-54-204-118-28.compute-1.amazonaws.com" -> null
  - instance_public_ip  = "54.204.118.28" -> null
  - instance_type       = "t3.micro" -> null
  - ssh_command         = "ssh -i ~/.ssh/projeto-final ec2-user@54.204.118.28" -> null
  - workspace           = "prod" -> null
terraform_data.workspace_guard: Destroying... [id=9232213c-e1bc-129a-88cd-7512159811c0]
terraform_data.workspace_guard: Destruction complete after 0s
module.network.aws_route_table_association.public: Destroying... [id=rtbassoc-0476fd62be067ff09]
module.docker_host.aws_vpc_security_group_egress_rule.all: Destroying... [id=sgr-09c53e721d0bb21e4]
module.docker_host.aws_vpc_security_group_ingress_rule.app: Destroying... [id=sgr-098bb1ac91031f402]
module.network.aws_route.public_internet_access: Destroying... [id=r-rtb-0ec0267c75d6228751080289494]
module.docker_host.aws_vpc_security_group_ingress_rule.ssh: Destroying... [id=sgr-0007c0d155c89754c]
module.docker_host.aws_instance.this: Destroying... [id=i-074c111f6ec39294c]
module.network.aws_route_table_association.public: Destruction complete after 2s
module.docker_host.aws_vpc_security_group_ingress_rule.ssh: Destruction complete after 2s
module.docker_host.aws_vpc_security_group_ingress_rule.app: Destruction complete after 2s
module.docker_host.aws_vpc_security_group_egress_rule.all: Destruction complete after 3s
module.network.aws_route.public_internet_access: Destruction complete after 3s
module.network.aws_internet_gateway.this: Destroying... [id=igw-019f0783984220733]
module.network.aws_route_table.public: Destroying... [id=rtb-0ec0267c75d622875]
module.network.aws_route_table.public: Destruction complete after 2s
module.docker_host.aws_instance.this: Still destroying... [id=i-074c111f6ec39294c, 00m10s elapsed]
module.network.aws_internet_gateway.this: Still destroying... [id=igw-019f0783984220733, 00m10s elapsed]
module.docker_host.aws_instance.this: Still destroying... [id=i-074c111f6ec39294c, 00m20s elapsed]
module.network.aws_internet_gateway.this: Still destroying... [id=igw-019f0783984220733, 00m20s elapsed]
module.docker_host.aws_instance.this: Still destroying... [id=i-074c111f6ec39294c, 00m30s elapsed]
module.network.aws_internet_gateway.this: Destruction complete after 27s
module.docker_host.aws_instance.this: Destruction complete after 32s
aws_key_pair.this: Destroying... [id=projeto-final-pos-devops-iac-prod-key]
module.network.aws_subnet.public: Destroying... [id=subnet-0b58934fa688d3d19]
module.docker_host.aws_security_group.this: Destroying... [id=sg-0a28bd879f288b26d]
aws_key_pair.this: Destruction complete after 1s
module.docker_host.aws_security_group.this: Destruction complete after 2s
module.network.aws_subnet.public: Destruction complete after 4s
module.network.aws_vpc.this: Destroying... [id=vpc-013bbbd7101615e90]
module.network.aws_vpc.this: Destruction complete after 2s
Releasing state lock. This may take a few moments...

Destroy complete! Resources: 13 destroyed.
