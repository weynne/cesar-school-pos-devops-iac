# Entry point: the workspace guard and the composition of the two modules.
# Read this first -- it shows how network and web-server fit together.

# "default" is not an environment. It is mapped in locals.tf only so that
# validate and plan can resolve, but applying there would create a third,
# unwanted VPC. Preconditions are evaluated at plan time and not by
# `terraform validate`, so this guard blocks the apply without breaking the
# clean-validate requirement. terraform_data is built in -- no provider, no
# cloud resource, no cost.
resource "terraform_data" "workspace_guard" {
  lifecycle {
    precondition {
      condition     = contains(["dev", "prod"], terraform.workspace)
      error_message = "Refusing to run in workspace '${terraform.workspace}'. Select a real environment first: terraform workspace select dev|prod"
    }
  }
}

module "network" {
  source = "./modules/network"

  name_prefix = local.name_prefix
  vpc_cidr    = local.config.vpc_cidr
}

module "web_server" {
  source = "./modules/web-server"

  # Referencing module.network outputs is what orders the creation:
  # Terraform infers the dependency from the reference, so no depends_on.
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id

  name_prefix      = local.name_prefix
  environment      = local.environment
  instance_type    = local.config.instance_type
  http_port        = var.http_port
  ssh_ingress_cidr = var.ssh_ingress_cidr
  student_name     = var.student_name
  class_name       = var.class_name
  stack_items      = var.stack_items
  page_title       = var.page_title
  page_subtitle    = var.page_subtitle
  course_name      = var.course_name
  professor_name   = var.professor_name
  key_name         = var.key_name
}
