# Minimum versions this project is known to work with: Terraform itself and
# the AWS provider. Pinned so a new major release cannot break the project
# without an explicit decision.

terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
