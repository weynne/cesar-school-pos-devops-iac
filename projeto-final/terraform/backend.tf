# Where the remote state lives: bucket, object key and locking.
# Separate from versions.tf because this changes when the bucket, account or
# environment changes -- versions.tf changes about once a year.

terraform {
  # No variables or interpolation allowed here: the backend is read before
  # any variable exists. Values must be literal.
  backend "s3" {
    bucket       = "tfstate-pos-devops-iac-weynne-2026"
    key          = "projeto-final/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
