# How to talk to AWS: region and organizational tagging. No credentials here,
# ever -- the provider resolves them from the environment, ~/.aws/credentials
# or instance metadata, in that order.

provider "aws" {
  region = var.aws_region

  # Applies to every taggable resource, including those inside modules.
  # Name is intentionally absent: it differs per resource and is merged there.
  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project_name
      Owner       = var.owner
      ManagedBy   = "Terraform"
    }
  }
}
