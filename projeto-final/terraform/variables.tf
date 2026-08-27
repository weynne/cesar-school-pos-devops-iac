# Project inputs. Only `owner` and `ssh_ingress_cidr` are required; everything
# else has a versioned default, so a fresh clone runs with two values.

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project identifier, used as a prefix for resource names and in the Project tag"
  type        = string
  default     = "projeto-final-pos-devops-iac"
}

variable "owner" {
  description = "Person accountable for these resources. Goes into the Owner tag of everything provisioned"
  type        = string
}

variable "app_port" {
  description = "TCP port exposed publicly by the container"
  type        = number
  default     = 3000
}

variable "ssh_ingress_cidr" {
  description = "Your public IP in /32 CIDR form, allowed to reach port 22. Find it with: echo $(curl -s https://checkip.amazonaws.com)/32"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key registered as the EC2 key pair. Generate the pair with: ssh-keygen -t ed25519 -f ~/.ssh/projeto-final"
  type        = string
  default     = "~/.ssh/projeto-final.pub"
}
