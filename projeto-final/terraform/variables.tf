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
  default     = "atividade1-pos-devops-iac"
}

variable "owner" {
  description = "Person accountable for these resources. Goes into the Owner tag of everything provisioned"
  type        = string
}

variable "http_port" {
  description = "TCP port exposed publicly by the web server"
  type        = number
  default     = 80
}

variable "ssh_ingress_cidr" {
  description = "Your public IP in /32 CIDR form, allowed to reach port 22. Find it with: echo $(curl -s https://checkip.amazonaws.com)/32"
  type        = string
}

variable "student_name" {
  description = "Student name displayed on the public web page served by the instance"
  type        = string
  default     = "Weynne Guimarães"
}

variable "class_name" {
  description = "Class identifier displayed on the public web page served by the instance"
  type        = string
  default     = "2025.2"
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access. Leave null to launch without one. In the AWS Academy Learner Lab, use vockey"
  type        = string
  default     = null
}

variable "page_title" {
  description = "First line of the page headline shown on the published page"
  type        = string
  default     = "Atividade 1"
}

variable "page_subtitle" {
  description = "Second line of the page headline shown on the published page"
  type        = string
  default     = "Terraform na AWS"
}

variable "stack_items" {
  description = "Infrastructure components listed in the page footer. Keep in sync with what the modules actually create"
  type        = list(string)
  default = [
    "VPC",
    "Subnet",
    "Internet Gateway",
    "Route Table",
    "Security Group",
    "EC2",
    "Remote State in S3",
  ]
}

variable "course_name" {
  description = "Course name displayed on the public web page"
  type        = string
  default     = "Infraestrutura como Código (IaC) e Gerenciamento de Configuração"
}

variable "professor_name" {
  description = "Professor name displayed on the public web page"
  type        = string
  default     = "Cris Apolinário"
}