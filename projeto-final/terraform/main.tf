# Entry point: the workspace guard, the SSH key pair and the composition of
# the two modules. Read this first -- it shows how they fit together.

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

# Our own pair, not the Learner Lab's "vockey": that one exists outside
# Terraform. Only the public half reaches AWS, so the private key stays local.
resource "aws_key_pair" "this" {
  # Prefixed, not fixed: key pair names are unique per region, so a fixed name
  # applies in dev and then fails in prod with InvalidKeyPair.Duplicate.
  key_name = "${local.name_prefix}-key"

  # pathexpand() because file() does not expand ~.
  public_key = file(pathexpand(var.public_key_path))
}

module "network" {
  source = "./modules/network"

  name_prefix = local.name_prefix
  vpc_cidr    = local.config.vpc_cidr
}

module "docker_host" {
  source = "./modules/docker-host"

  # Referencing module.network outputs is what orders the creation:
  # Terraform infers the dependency from the reference, so no depends_on.
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id

  name_prefix      = local.name_prefix
  instance_type    = local.config.instance_type
  app_port         = var.app_port
  ssh_ingress_cidr = var.ssh_ingress_cidr
  key_name         = aws_key_pair.this.key_name
}
