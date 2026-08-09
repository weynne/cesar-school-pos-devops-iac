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
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Instance type must be t2.micro or t3.micro (Free Tier / Learner Lab)."
  }
}

variable "http_port" {
  description = "The port for HTTP traffic"
  type        = number
  default     = 80

  validation {
    condition     = var.http_port > 0 && var.http_port <= 65535
    error_message = "HTTP port must be between 1 and 65535."
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

variable "student_name" {
  description = "Student name displayed on the public web page served by this instance"
  type        = string
}

# Received as data rather than read from terraform.workspace: a module that
# knows about workspaces only works in projects that use them.
variable "environment" {
  description = "Environment label displayed on the public web page, e.g. dev or prod"
  type        = string
}

variable "class_name" {
  description = "Class identifier displayed on the public web page served by this instance"
  type        = string
}

variable "page_title" {
  description = "First line of the page headline, e.g. the activity name"
  type        = string
}

variable "page_subtitle" {
  description = "Second line of the page headline, e.g. the activity topic"
  type        = string
}

variable "stack_items" {
  description = "Infrastructure components listed in the page footer. Set by the caller, which is the only place that knows the full stack across modules"
  type        = list(string)
  default     = []
}

variable "course_name" {
  description = "Course/subject name displayed on the public web page served by this instance"
  type        = string
}

variable "professor_name" {
  description = "Professor name displayed on the public web page served by this instance"
  type        = string
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access. Leave null to launch the instance without one"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags to merge into every resource created by this module"
  type        = map(string)
  default     = {}
}

variable "ami_parameter_name" {
  description = "SSM Parameter Store path resolving to the AMI ID. Defaults to the latest Amazon Linux 2023 (x86_64). The user_data assumes a RHEL-family distro (uses dnf), so only substitute AMIs from that family."
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
