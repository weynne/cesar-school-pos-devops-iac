variable "name_prefix" {
  description = "Prefix applied to the name of every resource created by this module"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC. The public subnet is derived from it via cidrsubnet()"
  type        = string

  validation {
    # The prefix ceiling matters: cidrsubnet() adds 8 bits, so a /25 or
    # smaller block would yield a subnet AWS refuses to create (min /28).
    condition     = can(cidrnetmask(var.vpc_cidr)) && tonumber(split("/", var.vpc_cidr)[1]) <= 24
    error_message = "Must be a valid CIDR with prefix /24 or larger (e.g. 10.10.0.0/16)."
  }
}

variable "tags" {
  description = "Additional tags to merge into every resource created by this module"
  type        = map(string)
  default     = {}
}
