terraform_data.workspace_guard: Refreshing state... [id=7e41c3c6-cb02-5457-bf53-5e245f704e38]
module.web_server.data.aws_ssm_parameter.ami: Reading...
module.network.data.aws_availability_zones.available: Reading...
module.network.aws_vpc.this: Refreshing state... [id=vpc-0b14da9a9c7bccab9]
module.web_server.data.aws_ssm_parameter.ami: Read complete after 0s [id=/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64]
module.network.data.aws_availability_zones.available: Read complete after 0s [id=us-east-1]
module.network.aws_internet_gateway.this: Refreshing state... [id=igw-0d2f0ff98dd5dfd5e]
module.network.aws_route_table.public: Refreshing state... [id=rtb-0b91052728bee2127]
module.network.aws_subnet.public: Refreshing state... [id=subnet-060d094ff91b477dd]
module.web_server.aws_security_group.this: Refreshing state... [id=sg-0e92852384f096e48]
module.network.aws_route_table_association.public: Refreshing state... [id=rtbassoc-0674ac91c645cd309]
module.network.aws_route.public_internet_access: Refreshing state... [id=r-rtb-0b91052728bee21271080289494]
module.web_server.aws_vpc_security_group_ingress_rule.ssh: Refreshing state... [id=sgr-062d97ed2117ea32c]
module.web_server.aws_vpc_security_group_ingress_rule.http: Refreshing state... [id=sgr-0a693824500ca2fb8]
module.web_server.aws_vpc_security_group_egress_rule.all: Refreshing state... [id=sgr-04a4d549d012073d4]
module.web_server.aws_instance.this: Refreshing state... [id=i-0a829175c9a1fbb89]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # terraform_data.workspace_guard will be destroyed
  - resource "terraform_data" "workspace_guard" {
      - id = "7e41c3c6-cb02-5457-bf53-5e245f704e38" -> null
    }

  # module.network.aws_internet_gateway.this will be destroyed
  - resource "aws_internet_gateway" "this" {
      - arn      = "arn:aws:ec2:us-east-1:123456789012:internet-gateway/igw-0d2f0ff98dd5dfd5e" -> null
      - id       = "igw-0d2f0ff98dd5dfd5e" -> null
      - owner_id = "123456789012" -> null
      - region   = "us-east-1" -> null
      - tags     = {
          - "Name" = "atividade1-pos-devops-iac-prod-igw"
        } -> null
      - tags_all = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-igw"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - vpc_id   = "vpc-0b14da9a9c7bccab9" -> null
    }

  # module.network.aws_route.public_internet_access will be destroyed
  - resource "aws_route" "public_internet_access" {
      - destination_cidr_block      = "0.0.0.0/0" -> null
      - gateway_id                  = "igw-0d2f0ff98dd5dfd5e" -> null
      - id                          = "r-rtb-0b91052728bee21271080289494" -> null
      - origin                      = "CreateRoute" -> null
      - region                      = "us-east-1" -> null
      - route_table_id              = "rtb-0b91052728bee2127" -> null
      - state                       = "active" -> null
        # (14 unchanged attributes hidden)
    }

  # module.network.aws_route_table.public will be destroyed
  - resource "aws_route_table" "public" {
      - arn              = "arn:aws:ec2:us-east-1:123456789012:route-table/rtb-0b91052728bee2127" -> null
      - id               = "rtb-0b91052728bee2127" -> null
      - owner_id         = "123456789012" -> null
      - propagating_vgws = [] -> null
      - region           = "us-east-1" -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0d2f0ff98dd5dfd5e"
                # (12 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Name" = "atividade1-pos-devops-iac-prod-public-rt"
        } -> null
      - tags_all         = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-public-rt"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - vpc_id           = "vpc-0b14da9a9c7bccab9" -> null
    }

  # module.network.aws_route_table_association.public will be destroyed
  - resource "aws_route_table_association" "public" {
      - id             = "rtbassoc-0674ac91c645cd309" -> null
      - region         = "us-east-1" -> null
      - route_table_id = "rtb-0b91052728bee2127" -> null
      - subnet_id      = "subnet-060d094ff91b477dd" -> null
        # (1 unchanged attribute hidden)
    }

  # module.network.aws_subnet.public will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-060d094ff91b477dd" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.20.0.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-060d094ff91b477dd" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "123456789012" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - region                                         = "us-east-1" -> null
      - tags                                           = {
          - "Name" = "atividade1-pos-devops-iac-prod-public-subnet"
        } -> null
      - tags_all                                       = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-public-subnet"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - vpc_id                                         = "vpc-0b14da9a9c7bccab9" -> null
        # (4 unchanged attributes hidden)
    }

  # module.network.aws_vpc.this will be destroyed
  - resource "aws_vpc" "this" {
      - arn                                  = "arn:aws:ec2:us-east-1:123456789012:vpc/vpc-0b14da9a9c7bccab9" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.20.0.0/16" -> null
      - default_network_acl_id               = "acl-0dabfffba1ee84c77" -> null
      - default_route_table_id               = "rtb-03b6c72e600299fba" -> null
      - default_security_group_id            = "sg-034db187322effaef" -> null
      - dhcp_options_id                      = "dopt-0ffab6739ea05d548" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-0b14da9a9c7bccab9" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-03b6c72e600299fba" -> null
      - owner_id                             = "123456789012" -> null
      - region                               = "us-east-1" -> null
      - tags                                 = {
          - "Name" = "atividade1-pos-devops-iac-prod-vpc"
        } -> null
      - tags_all                             = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-vpc"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
        # (4 unchanged attributes hidden)
    }

  # module.web_server.aws_instance.this will be destroyed
  - resource "aws_instance" "this" {
      - ami                                  = "ami-07a5b367e8dc8bd92" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:123456789012:instance/i-0a829175c9a1fbb89" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - force_destroy                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0a829175c9a1fbb89" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "vockey" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-02e51e87cad584eef" -> null
      - private_dns                          = "ip-10-20-0-107.ec2.internal" -> null
      - private_ip                           = "10.20.0.107" -> null
      - public_dns                           = "ec2-13-218-140-228.compute-1.amazonaws.com" -> null
      - public_ip                            = "13.218.140.228" -> null
      - region                               = "us-east-1" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-060d094ff91b477dd" -> null
      - tags                                 = {
          - "Name" = "atividade1-pos-devops-iac-prod-web-instance"
        } -> null
      - tags_all                             = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-web-instance"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - tenancy                              = "default" -> null
      - user_data                            = <<-EOT
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
              <img class="logo" alt="CESAR School" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANoAAADICAMAAAC53Q95AAAAAXNSR0IB2cksfwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAFpQTFRFAAAA/2AA/2AA/2AA/2AC/2AC/2AC/2AB/2AB/2AC/2AD/2AB/2AC/2AA/2AA/2AB/2AC/2AA/2AB/2AA/2AC/2AC/2AD/2AC/2AC/2AC/2ED/2AB/2AC/2MAL5NOLQAAAB50Uk5TABAwUHCPn7/f72DPgCBgr/9A73CQ31B/oG9fsM8f3mznDwAADL1JREFUeJztXeuao6oSDWrERFExppOePef9X/MIonIpENR0OvOxfs2kEWpxLaCoOp2OBErS7Jzj4nIN+ep6KXFeZWmCDhXmIJC0PjfFpZ0QRm3+7FI254z+FoYozfJy4cTQlTkNyiOhtx53SwYXnL+ZIEnPjUqqLfNbSjZmh2gl8xsIVpvz2gFEM51Vl98OGCzJrZHptfcmC+sBu4DoGeu08A2s32EIVnnzZf7h3Jyr1NbnaF+o2ePqJ+jRh06r7XpARsKmFfucgudpowIJJjq7FmfJ8WxmoDrXaQ3d0KhQuVWHGaWqgQZl80YpdTpAbPrUy7rn6UvmFpQZzTVU5U0va2jV6Y9FD5GSs6TLwLo0VyMxqfWma1sg2T4MvIxCBmJ6g9HHLItl8Jmgz+UbU2yA3JDsuLajQHu1ba7Jga4z/a4PGhf1Um9m94bItXm6j9GI5AHxMolJyXBwn5HkN7oCTO6uCxAMCnVEoPxviX+1oRwiiW/UDOlhIYK0ORUIbrC2y/Sy5QrIN5VF5KIexl+hhhuabuOcYiNm1uofJeHGulS6x10vAsEN197P4eSsxMz+9lD/rjfpFmomt9PNIo4x6jcT64xG+dYrctPUTPVcDIETm0jtI4CclVjbGbM6MdKUGwYANUrERhrLgGP14DsI6N2WRdua61W+o6QJ6AwUZWrE9nZr7z76M2rsxIBxhCzVGNBy9AyK/J+ZsnaItj7kvu01A87r+hiZAWhNIK8HvHIO1QOktsyTY3p3X3E2WVtAKryrsMZ5DDBs0kENTuACyeeq+DZ3FJY4RtmAGpLP+QWTEDfnrKY0IQIJ5fvTwinlgBKSsHJ+Yk6rE/RpXAf4Ybny0WbcoNLgoT3jYllUH+7PgOmYwTW09wDq/QPc/QrQ0RiAWVwFMGUxOIfndkC936e08wZmNr0XvaRL2rYP6xVpiLnODB7XjJtt+t4BqyLqUZbGDVIHdFysc6t73gpHYdUtVidkBqVPrs0gI+x7TLt6twW9fX26rn/dKm3uWncl2JvNssvfBOw4VyFrE6RAEvqBewNdHzHkut6p5/rOxvPGymMKEQBXjaVOnzubzjzWVOE3bhjEcPMamgJubsqpYihwtaZP+zObumRQR3KpoCP0uxYfFH29mq9bddfBVackTAq7CirTq5WrQCerpvc6yXdtkCGwZvMfaQK+h0iI3voG2zpoV+C8qn1v5MB9uBP98NXa5sJE4AEBSiit62rCra6HHU7Q2ZD9FMqOi/eatovcPmwh1rKzlY1K0v4z99cSYyrJ9j3JnjN3X1479ID89Hfzt0N/PuYyyMaLmpewAcCr29Y1dodfUwpe0CVsEO57qTGU52PvmFF9PkDZPoQaQ5kfYt+Bkiw/aA9R7hprRm5NRjebQJD0MFYc+GSYMOwGNyHzN/zh1njNoXtZjv6UHZ7nhAIPqlRVp+Px6kKFH7Ny/SRvyuMpTaiDtjQfBfLC49/3gu1qjj6O+iVgR7Tu249PRcHH9T/ZbOPB4r/YbIWYjl912fJGzJchL7pseR+WA1P0uoXzLSgkVchhtvCBUG8d03eLcyQ0Df0fmkqMc41/hhtwYpP+E+PNNCJjOPb+7z2w2C2cyMdvArB9A/zh6qTT6pl+cKe0X+6LTnn8WckPwXG5PyH9yIYr/Y4Kq49bBjrvtwWf1is9+uJnkgu+DvsUcpvu+T6AXNdvvSYixrPGX4Wu2nVBdIh50ktgvgYLb7q95kmvQLdqGuSJ9Blsv/NKAE9vdwDVv+XUa+B1+DNflL6/Z4JPwI8B7d+4pXv5m3rylsbzMb07hl79/MHWW326fjR0FxovQdfc3uV3hKRV86L2K5q3eBtRgRRfDUeQ6r3tJH8GCbfs3NFHizLvt/uY+QkQmt6qHOPCi2VX4CavbjX9zZQAIGYgktb1bbRf7fM8ny1Za0pJmC1rRERERERERERERERERERERETEBJSd83Pgw0gUeh6F6uBCEA2Xi1Z5Pl/pTC/V72u+G+QM+BV3yBvfya0a4FbIhi/xybrfhUUu8YhyfDiOlneH3txm5wLegi4P/UtfQRdHFd5+Gf8sZ7eZKLTrK36h63k3Jzkk8OR2HQvhV3OeD575M388ftL4fULGT3repRL+34bVCrPPhb2AQXIySzZuPOlXG1i8K0C94cjVhqFrFcyQGD1DSul4SuYCtGfO+4TBLvV1NjrJyX3D+tWGf4+YwHyFjC9j2HOm3ucT0s4MevZ4GS8vUGq/17loLpQZ9EIOAcFP/ueV+QzWNU6znDYfXgq+2tmv3pUJdg92VJy08wMI6ivyJWhqZKgWD5EV7CzSgFQbFauNcGoSH29qbGCHGbLsosZ8TOUbqdHln17UhMfmC/b2U8yM17Oa4x5ArRrSc1/vHdlIrS04Wu8xlMwWGZ6Lp2qX701tAnulsZHaAs/llMw2en6eundSY4rBTmr+Bs0ndhd8814KGTVxh1oEUGOfcK8D5VZqm02KiO8itW0aEUvRk69wu2bIDXh6rvLbqIl0iOsSf5da9LQCIBuooWwakv1PUBu1kX52jkjau5fmihZ95nRuvKpjWGemFftudeqqYh813jfppL6zZc5Ln2Hrr9hmPDwLzeY9wndr9SCrYje1+6go/M1q7q7Kq1D+9pK5f09y3/0Gd0V7H1ZgVlixnv50DDXpseETSA8dE/AHABeuYEDP/IBP5BeNgBKOzFzWqAGFGNROZDIrhiblL2hkLP4MIWbwJ9N7iALaXuDWiBuVLcMjA0YKAbYcJjVmd4txA78HoBhcGupyXK+hbygGt32kwhhbQh/1JmGUznss6Z/Ln7E5EoZ01PxnOBD9NIuxiIiIiIiIiIiIiIiIiIiIiIgdIA07uHrHm7vvoWBXaKLdGO/vfiKWvAYUcC+5DW+jRiK17YjUjkektgOR2vGI1HYgUjseVmo0a8qiKPF51SsGPbOYagWuYHVtoZbUVeWMKi2A6nwouiibzF40YqUWTpMAmJoaLctl4q6kBEOVCWpkDl2+YgZJ8XrRc2YuSxyQmhFrzxpeTU8JRAccqSme7hx+DpEesw+KN7hUZyi1P60JOKIhECLSsG6E4rXebVsNKPa4fsdPpPhHgdTgQDUXwKYJDH6pcwND0V5gbn9Ap69qjko810Bq86fFsJNbnNaYRihLEPSuKJeEGjc4yi7YC5bYmF0pFy3nKDErYKMNOzVhuInFVJbchF2OYS4yta7wX5jMPj/Vqlyo4ZrSdEoFWNPNUouJJpndqj3MNHh1qjWp9QYRHmnYtGkSM0MzFyGshDRDnIna5Dt6clxuzpNiBimXzjq7SJ24Tcw6j3XSpDbKp1TJII1pYkeBxmRGtE+tNgW1xcJJREE3mk1kqH5fKdwmZjZ/7yvUeGPoAwto/bEKtEWzMltXUJOEGQ3hjYjUYy/QzexkbkHMAGpPrXdbgAyJx5+NhFezjXqoRxI4Q4lbGDOAmoi/dr+6hyk1PrRgpKbMZV/8J00NyGwZTtzOYcwAakvYJGesyVESDwPeq8mDmKN06uBQiaqFvy8zaF27SfmUZ9tUNJbncYDpS+0vNNLksgKZgYqW9g4C1vjG8eJhKH41mxekxn+zGFgvEtmY0aqqtB4Oqse15oEUA/k9w6gpjW+nZhu7vZDkYmE2TmqqcmLZr+nkzAnzR6kt2pVl5k6AHO1bUdV5rJEisEOuU+OzF2x8L2vEMDfq32pjetnzr65CBk4j69T4NGKs4zy5stMBuUEr5crZyPISSy8UWK5g+FID13GeetIbHdzGJKqI68c+k4qqsRh7t8drGF9q1JLhooNUVm6AxuN3ojVmqRv9X6BaRqZHYl9qQlUw9tSSDmLjhsY02lMSiBrRHciD9Mdy1C0l+mvuMX2piQy1/beqN1q4NVISSRhT7CE3VT4KtprQj+Wk/NRC5+ZNTTSbclKha8QQt+mkyNgrG710zE1SQcRRjKEuimKW067rKJvme8Gb2qzhzWXPJ4FLg1R6mvlQzdTRxj8Q/YeBLj8NJbPffmMQzbEe7xklhC4naFupLYExmyslST2fXMpdbda5BvkSkj6m9akz9ZSnqPpkEA6zZ7AWN+/ASxoCBx3SVLkAagh2ca0OIktwMeCkVH15TG1B10A1AYpj2ekdN4AazE2fHiBuHXgGrOSWW74tYbXUjKtnJgyhtujBC0zd/GbUKPhQTKv6UefQY+3Y31qjfjVhGDXplf2YI/TuUZPPHp5GCdco9F1yKz2+HIuZZSnAhIHUmGI+H65iW6gFqVTsEm+uhA5LdcRc1+d55RHwILlVeW6NjIC4J3H1t3r4yRXiiNbDzrJ2H6ImKfNNDr/sk0BS7pEpOi+PiPg5/B/U9sis9ieHZQAAAABJRU5ErkJggg==">
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
        EOT -> null
      - user_data_replace_on_change          = true -> null
      - vpc_security_group_ids               = [
          - "sg-0e92852384f096e48",
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
          - network_interface_id  = "eni-02e51e87cad584eef" -> null
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
              - "Owner"       = "weynne"
              - "Project"     = "atividade1-pos-devops-iac"
            } -> null
          - throughput            = 125 -> null
          - volume_id             = "vol-0919448cc29bc8712" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp3" -> null
        }
    }

  # module.web_server.aws_security_group.this will be destroyed
  - resource "aws_security_group" "this" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group/sg-0e92852384f096e48" -> null
      - description            = "Allow HTTP and SSH traffic" -> null
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
      - id                     = "sg-0e92852384f096e48" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow HTTP traffic from anywhere"
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
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
      - name                   = "atividade1-pos-devops-iac-prod-web-77fb88d7cc3cade041196a5347" -> null
      - name_prefix            = "atividade1-pos-devops-iac-prod-web-" -> null
      - owner_id               = "123456789012" -> null
      - region                 = "us-east-1" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Name" = "atividade1-pos-devops-iac-prod-web-sg"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-web-sg"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - vpc_id                 = "vpc-0b14da9a9c7bccab9" -> null
    }

  # module.web_server.aws_vpc_security_group_egress_rule.all will be destroyed
  - resource "aws_vpc_security_group_egress_rule" "all" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group-rule/sgr-04a4d549d012073d4" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - description            = "Allow all outbound traffic" -> null
      - id                     = "sgr-04a4d549d012073d4" -> null
      - ip_protocol            = "-1" -> null
      - region                 = "us-east-1" -> null
      - security_group_id      = "sg-0e92852384f096e48" -> null
      - security_group_rule_id = "sgr-04a4d549d012073d4" -> null
      - tags                   = {
          - "Name" = "atividade1-pos-devops-iac-prod-web-sg-egress"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-web-sg-egress"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
    }

  # module.web_server.aws_vpc_security_group_ingress_rule.http will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "http" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group-rule/sgr-0a693824500ca2fb8" -> null
      - cidr_ipv4              = "0.0.0.0/0" -> null
      - description            = "Allow HTTP traffic from anywhere" -> null
      - from_port              = 80 -> null
      - id                     = "sgr-0a693824500ca2fb8" -> null
      - ip_protocol            = "tcp" -> null
      - region                 = "us-east-1" -> null
      - security_group_id      = "sg-0e92852384f096e48" -> null
      - security_group_rule_id = "sgr-0a693824500ca2fb8" -> null
      - tags                   = {
          - "Name" = "atividade1-pos-devops-iac-prod-web-sg-http"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-web-sg-http"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - to_port                = 80 -> null
    }

  # module.web_server.aws_vpc_security_group_ingress_rule.ssh will be destroyed
  - resource "aws_vpc_security_group_ingress_rule" "ssh" {
      - arn                    = "arn:aws:ec2:us-east-1:123456789012:security-group-rule/sgr-062d97ed2117ea32c" -> null
      - cidr_ipv4              = "203.0.113.42/32" -> null
      - description            = "Allow SSH traffic from your public IP" -> null
      - from_port              = 22 -> null
      - id                     = "sgr-062d97ed2117ea32c" -> null
      - ip_protocol            = "tcp" -> null
      - region                 = "us-east-1" -> null
      - security_group_id      = "sg-0e92852384f096e48" -> null
      - security_group_rule_id = "sgr-062d97ed2117ea32c" -> null
      - tags                   = {
          - "Name" = "atividade1-pos-devops-iac-prod-web-sg-ssh"
        } -> null
      - tags_all               = {
          - "Environment" = "prod"
          - "ManagedBy"   = "Terraform"
          - "Name"        = "atividade1-pos-devops-iac-prod-web-sg-ssh"
          - "Owner"       = "weynne"
          - "Project"     = "atividade1-pos-devops-iac"
        } -> null
      - to_port                = 22 -> null
    }

Plan: 0 to add, 0 to change, 12 to destroy.

Changes to Outputs:
  - instance_public_dns = "ec2-13-218-140-228.compute-1.amazonaws.com" -> null
  - instance_public_ip  = "13.218.140.228" -> null
  - instance_type       = "t3.micro" -> null
  - web_url             = "http://13.218.140.228" -> null
  - workspace           = "prod" -> null
terraform_data.workspace_guard: Destroying... [id=7e41c3c6-cb02-5457-bf53-5e245f704e38]
terraform_data.workspace_guard: Destruction complete after 0s
module.network.aws_route_table_association.public: Destroying... [id=rtbassoc-0674ac91c645cd309]
module.web_server.aws_vpc_security_group_ingress_rule.ssh: Destroying... [id=sgr-062d97ed2117ea32c]
module.network.aws_route.public_internet_access: Destroying... [id=r-rtb-0b91052728bee21271080289494]
module.web_server.aws_vpc_security_group_egress_rule.all: Destroying... [id=sgr-04a4d549d012073d4]
module.web_server.aws_vpc_security_group_ingress_rule.http: Destroying... [id=sgr-0a693824500ca2fb8]
module.web_server.aws_instance.this: Destroying... [id=i-0a829175c9a1fbb89]
module.web_server.aws_vpc_security_group_ingress_rule.ssh: Destruction complete after 1s
module.network.aws_route_table_association.public: Destruction complete after 2s
module.web_server.aws_vpc_security_group_ingress_rule.http: Destruction complete after 2s
module.web_server.aws_vpc_security_group_egress_rule.all: Destruction complete after 2s
module.network.aws_route.public_internet_access: Destruction complete after 2s
module.network.aws_internet_gateway.this: Destroying... [id=igw-0d2f0ff98dd5dfd5e]
module.network.aws_route_table.public: Destroying... [id=rtb-0b91052728bee2127]
module.network.aws_route_table.public: Destruction complete after 1s
module.web_server.aws_instance.this: Still destroying... [id=i-0a829175c9a1fbb89, 00m10s elapsed]
module.network.aws_internet_gateway.this: Still destroying... [id=igw-0d2f0ff98dd5dfd5e, 00m10s elapsed]
module.web_server.aws_instance.this: Still destroying... [id=i-0a829175c9a1fbb89, 00m20s elapsed]
module.network.aws_internet_gateway.this: Still destroying... [id=igw-0d2f0ff98dd5dfd5e, 00m20s elapsed]
module.web_server.aws_instance.this: Still destroying... [id=i-0a829175c9a1fbb89, 00m30s elapsed]
module.network.aws_internet_gateway.this: Still destroying... [id=igw-0d2f0ff98dd5dfd5e, 00m30s elapsed]
module.web_server.aws_instance.this: Still destroying... [id=i-0a829175c9a1fbb89, 00m40s elapsed]
module.network.aws_internet_gateway.this: Still destroying... [id=igw-0d2f0ff98dd5dfd5e, 00m40s elapsed]
module.web_server.aws_instance.this: Still destroying... [id=i-0a829175c9a1fbb89, 00m50s elapsed]
module.network.aws_internet_gateway.this: Destruction complete after 49s
module.web_server.aws_instance.this: Destruction complete after 55s
module.network.aws_subnet.public: Destroying... [id=subnet-060d094ff91b477dd]
module.web_server.aws_security_group.this: Destroying... [id=sg-0e92852384f096e48]
module.network.aws_subnet.public: Destruction complete after 1s
module.web_server.aws_security_group.this: Destruction complete after 1s
module.network.aws_vpc.this: Destroying... [id=vpc-0b14da9a9c7bccab9]
module.network.aws_vpc.this: Destruction complete after 1s

Destroy complete! Resources: 12 destroyed.
