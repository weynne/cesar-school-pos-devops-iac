variable "name_prefix" {
  description = "The prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to deploy resources in"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy resources in"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = var.instance_type == "t3.micro"
    error_message = "Instance type must be t3.micro (Free Tier / Learner Lab)."
  }
}

variable "app_port" {
  description = "TCP port exposed publicly by the container"
  type        = number
  default     = 3000

  validation {
    condition     = var.app_port > 0 && var.app_port <= 65535
    error_message = "App port must be between 1 and 65535."
  }
}

variable "ssh_ingress_cidr" {
  description = "Your public IP in /32 CIDR form, allowed to reach port 22. Find it with: echo $(curl -s https://checkip.amazonaws.com)/32"
  type        = string

  validation {
    # cidrhost() actually parses the CIDR, so it rejects impossible octets
    # such as 999.999.999.999 that a shape-only regex would let through.
    condition     = can(cidrhost(var.ssh_ingress_cidr, 0)) && endswith(var.ssh_ingress_cidr, "/32")
    error_message = "Must be a valid /32 CIDR, e.g. 203.0.113.42/32."
  }
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
}

variable "tags" {
  description = "Additional tags to merge into every resource created by this module"
  type        = map(string)
  default     = {}
}

variable "ami_parameter_name" {
  description = "SSM Parameter Store path resolving to the AMI ID. Defaults to the latest Amazon Linux 2023 (x86_64). The Ansible role assumes a RHEL-family distro (uses dnf), so only substitute AMIs from that family."
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
