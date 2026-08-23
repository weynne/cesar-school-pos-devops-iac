# Per-workspace configuration: the only place that decides what differs
# between dev and prod. Values here are derived, never user input.

locals {
  # Single point of indirection: if this project ever moves away from
  # workspaces, only this line changes.
  environment = terraform.workspace

  # "default" is not a real environment -- it is the workspace Terraform
  # creates automatically, mapped here only so plan/validate work before
  # `terraform workspace new dev`. Real deployments use dev and prod.
  environment_config = {
    default = { instance_type = "t2.micro", vpc_cidr = "10.0.0.0/16" }
    dev     = { instance_type = "t2.micro", vpc_cidr = "10.10.0.0/16" }
    prod    = { instance_type = "t3.micro", vpc_cidr = "10.20.0.0/16" }
  }

  # Direct index instead of lookup(): an unmapped workspace name is always
  # a mistake, and should fail loudly rather than silently fall back.
  config = local.environment_config[local.environment]

  name_prefix = "${var.project_name}-${local.environment}"
}
