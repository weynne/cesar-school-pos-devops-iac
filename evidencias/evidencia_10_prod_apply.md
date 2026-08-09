module.web_server.data.aws_ssm_parameter.ami: Reading...
module.network.data.aws_availability_zones.available: Reading...
module.web_server.data.aws_ssm_parameter.ami: Read complete after 1s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]
module.network.data.aws_availability_zones.available: Read complete after 1s [id=us-east-1]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # terraform_data.workspace_guard will be created
  + resource "terraform_data" "workspace_guard" {
      + id = (known after apply)
    }

  # module.network.aws_internet_gateway.this will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + region   = "us-east-1"
      + tags     = {
          + "Name" = "atividade1-pos-devops-iac-prod-igw"
        }
      + tags_all = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-igw"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
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
          + "Name" = "atividade1-pos-devops-iac-prod-public-rt"
        }
      + tags_all         = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-public-rt"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
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
          + "Name" = "atividade1-pos-devops-iac-prod-public-subnet"
        }
      + tags_all                                       = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-public-subnet"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
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
          + "Name" = "atividade1-pos-devops-iac-prod-vpc"
        }
      + tags_all                             = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-vpc"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
        }
    }

  # module.web_server.aws_instance.this will be created
  + resource "aws_instance" "this" {
      + ami                                  = "ami-07a5b367e8dc8bd92"
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
      + key_name                             = "vockey"
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
          + "Name" = "atividade1-pos-devops-iac-prod-web-instance"
        }
      + tags_all                             = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-web-instance"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
        }
      + tenancy                              = (known after apply)
      + user_data                            = <<-EOT
            #!/bin/bash
            # -x prints every command to /var/log/cloud-init-output.log, which is the only
            # way to diagnose a boot-time failure after the fact.
            set -euxo pipefail
            
            # Order matters: /var/www/html is created by the httpd package.
            dnf install -y httpd
            systemctl enable --now httpd
            
            # Quoted delimiter: bash performs no expansion. Terraform already rendered
            # the page, so anything that looks like a shell variable must survive as-is.
            cat > /var/www/html/index.html <<'PAGE'
            <!doctype html>
            <html lang="pt-BR">
            <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width,initial-scale=1">
            <title>Atividade 1 - Terraform na AWS (prod)</title>
            <style>
              :root {
                --cream:  #fdf4ee;
                --orange: #ff6002;
                --navy:   #12106b;
                --ink:    #070606;
                --gray:   #595858;
              }
              * { box-sizing: border-box; }
              body {
                margin: 0; min-height: 100vh;
                background: var(--cream); color: var(--ink);
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                display: flex; align-items: center; justify-content: center;
                padding: 2.5rem 1.5rem; overflow-x: hidden;
              }
              .shape { position: fixed; z-index: 0; }
              .s1 { top: -90px; right: -70px; width: 300px; height: 300px;
                    background: var(--orange); border-radius: 50%; }
              .s2 { bottom: -130px; left: -90px; width: 340px; height: 340px;
                    background: var(--navy); border-radius: 50%; }
              main {
                position: relative; z-index: 1; width: 100%; max-width: 620px;
                background: #fff; border-radius: 20px;
                padding: 2.75rem 3rem;
                box-shadow: 0 26px 70px rgba(18,16,107,.13);
              }
              .logo { width: 84px; height: auto; display: block; margin-bottom: 1.9rem; }
              .badge {
                display: inline-block; background: var(--navy); color: #fff;
                font-size: .66rem; font-weight: 700; letter-spacing: .11em;
                text-transform: uppercase; padding: .42rem 1rem; border-radius: 999px;
                margin-bottom: 1.3rem;
              }
              .eyebrow {
                margin: 0 0 .35rem; font-size: .78rem; font-weight: 700;
                letter-spacing: .16em; text-transform: uppercase; color: var(--gray);
              }
              h1 {
                font-size: clamp(1.95rem, 5.2vw, 2.75rem); line-height: 1.07;
                margin: 0 0 .7rem; letter-spacing: -.025em; font-weight: 800;
                color: var(--orange);
              }
              .rule { height: 5px; width: 70px; background: var(--orange);
                      border-radius: 3px; margin-bottom: 1.8rem; }
              dl { margin: 0; display: grid; grid-template-columns: auto 1fr;
                   gap: 1rem 2rem; }
              dt { font-size: .66rem; font-weight: 700; letter-spacing: .14em;
                   text-transform: uppercase; color: var(--gray); padding-top: .3rem; }
              dd { margin: 0; font-size: 1.05rem; font-weight: 600; }
              .env {
                /* Dark text, not white: white on #ff6002 is only 3.03:1, below the
                   4.5:1 WCAG AA minimum. Dark ink on the same orange reaches 6.67:1. */
                display: inline-block; background: var(--orange); color: var(--ink);
                padding: .22rem .9rem; border-radius: 999px;
                font-size: .8rem; font-weight: 700;
                letter-spacing: .1em; text-transform: uppercase;
              }
              footer {
                margin-top: 2.1rem; padding-top: 1.35rem;
                border-top: 1px solid rgba(18,16,107,.12);
              }
              .stack-label {
                margin: 0 0 .75rem; font-size: .62rem; font-weight: 700;
                letter-spacing: .16em; text-transform: uppercase; color: var(--gray);
              }
              .tags { display: flex; flex-wrap: wrap; gap: .4rem;
                      list-style: none; margin: 0; padding: 0; }
              .tag {
                font-size: .71rem; font-weight: 600; color: var(--navy);
                background: rgba(18,16,107,.06); border-radius: 999px;
                padding: .3rem .72rem; white-space: nowrap;
              }
              @media (max-width: 540px) {
                main { padding: 2rem 1.4rem; }
                dl { grid-template-columns: 1fr; gap: .25rem 0; }
                dt { padding-top: 1rem; }
              }
            </style>
            </head>
            <body>
            <div class="shape s1" aria-hidden="true"></div>
            <div class="shape s2" aria-hidden="true"></div>
            <main>
              <img class="logo" alt="CESAR School" src="data:image/png;base64,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">
              <span class="badge">Especializa&ccedil;&atilde;o em DevOps</span>
              <p class="eyebrow">Atividade 1</p>
              <h1>Terraform na AWS</h1>
              <div class="rule" aria-hidden="true"></div>
              <dl>
                <dt>Disciplina</dt><dd>Infraestrutura como Código (IaC) e Gerenciamento de Configuração</dd>
                <dt>Professor(a)</dt><dd>Cris Apolinário</dd>
                <dt>Aluno(a)</dt><dd>Weynne Guimarães</dd>
                <dt>Turma</dt><dd>2025.2</dd>
                <dt>Ambiente</dt><dd><span class="env">prod</span></dd>
              </dl>
              <footer>
                <p class="stack-label">Provisionado como c&oacute;digo &middot; Terraform</p>
                <ul class="tags">
                  <li class="tag">VPC</li>
                  <li class="tag">Subnet</li>
                  <li class="tag">Internet Gateway</li>
                  <li class="tag">Route Table</li>
                  <li class="tag">Security Group</li>
                  <li class="tag">EC2</li>
                  <li class="tag">Remote State in S3</li>
                </ul>
              </footer>
            </main>
            </body>
            </html>
            
            PAGE
        EOT
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = true
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

  # module.web_server.aws_security_group.this will be created
  + resource "aws_security_group" "this" {
      + arn                    = (known after apply)
      + description            = "Allow HTTP and SSH traffic"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "atividade1-pos-devops-iac-prod-web-"
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "atividade1-pos-devops-iac-prod-web-sg"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-web-sg"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
        }
      + vpc_id                 = (known after apply)
    }

  # module.web_server.aws_vpc_security_group_egress_rule.all will be created
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
          + "Name" = "atividade1-pos-devops-iac-prod-web-sg-egress"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-web-sg-egress"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
        }
    }

  # module.web_server.aws_vpc_security_group_ingress_rule.http will be created
  + resource "aws_vpc_security_group_ingress_rule" "http" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow HTTP traffic from anywhere"
      + from_port              = 80
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags                   = {
          + "Name" = "atividade1-pos-devops-iac-prod-web-sg-http"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-web-sg-http"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
        }
      + to_port                = 80
    }

  # module.web_server.aws_vpc_security_group_ingress_rule.ssh will be created
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
          + "Name" = "atividade1-pos-devops-iac-prod-web-sg-ssh"
        }
      + tags_all               = {
          + "Environment" = "prod"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "atividade1-pos-devops-iac-prod-web-sg-ssh"
          + "Owner"       = "weynne"
          + "Project"     = "atividade1-pos-devops-iac"
        }
      + to_port                = 22
    }

Plan: 12 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_public_dns = (known after apply)
  + instance_public_ip  = (known after apply)
  + instance_type       = "t3.micro"
  + web_url             = (known after apply)
  + workspace           = "prod"
terraform_data.workspace_guard: Creating...
terraform_data.workspace_guard: Creation complete after 0s [id=7e41c3c6-cb02-5457-bf53-5e245f704e38]
module.network.aws_vpc.this: Creating...
module.network.aws_vpc.this: Creation complete after 3s [id=vpc-0b14da9a9c7bccab9]
module.network.aws_route_table.public: Creating...
module.network.aws_internet_gateway.this: Creating...
module.network.aws_subnet.public: Creating...
module.web_server.aws_security_group.this: Creating...
module.network.aws_internet_gateway.this: Creation complete after 2s [id=igw-0d2f0ff98dd5dfd5e]
module.network.aws_route_table.public: Creation complete after 2s [id=rtb-0b91052728bee2127]
module.network.aws_route.public_internet_access: Creating...
module.network.aws_route.public_internet_access: Creation complete after 1s [id=r-rtb-0b91052728bee21271080289494]
module.web_server.aws_security_group.this: Creation complete after 3s [id=sg-0e92852384f096e48]
module.web_server.aws_vpc_security_group_ingress_rule.ssh: Creating...
module.web_server.aws_vpc_security_group_ingress_rule.http: Creating...
module.web_server.aws_vpc_security_group_egress_rule.all: Creating...
module.web_server.aws_vpc_security_group_ingress_rule.ssh: Creation complete after 1s [id=sgr-062d97ed2117ea32c]
module.web_server.aws_vpc_security_group_egress_rule.all: Creation complete after 1s [id=sgr-04a4d549d012073d4]
module.web_server.aws_vpc_security_group_ingress_rule.http: Creation complete after 1s [id=sgr-0a693824500ca2fb8]
module.network.aws_subnet.public: Still creating... [00m10s elapsed]
module.network.aws_subnet.public: Creation complete after 13s [id=subnet-060d094ff91b477dd]
module.network.aws_route_table_association.public: Creating...
module.web_server.aws_instance.this: Creating...
module.network.aws_route_table_association.public: Creation complete after 0s [id=rtbassoc-0674ac91c645cd309]
module.web_server.aws_instance.this: Still creating... [00m10s elapsed]
module.web_server.aws_instance.this: Creation complete after 14s [id=i-0a829175c9a1fbb89]

Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

Outputs:

instance_public_dns = "ec2-13-218-140-228.compute-1.amazonaws.com"
instance_public_ip = "13.218.140.228"
instance_type = "t3.micro"
web_url = "http://13.218.140.228"
workspace = "prod"
