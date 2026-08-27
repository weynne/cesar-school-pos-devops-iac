# What the project exposes after an apply: where to reach the application and
# how to get into the instance.

output "instance_public_ip" {
  description = "Public IP address of the docker host instance"
  value       = module.docker_host.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the docker host instance"
  value       = module.docker_host.public_dns
}

output "app_url" {
  description = "URL to open in a browser to reach the container published by Ansible"
  value       = "http://${module.docker_host.public_ip}:${var.app_port}"
}

# Derived from public_key_path so the command cannot drift from the key the
# instance actually accepts.
output "ssh_command" {
  description = "Ready-to-paste SSH command for the docker host"
  value       = "ssh -i ${trimsuffix(var.public_key_path, ".pub")} ec2-user@${module.docker_host.public_ip}"
}

# The two outputs below make every apply/destroy log self-identifying: the
# assignment requires evidence stating which environment each run belongs to.
output "workspace" {
  description = "Terraform workspace this run was applied to"
  value       = terraform.workspace
}

output "instance_type" {
  description = "EC2 instance type resolved for the current workspace"
  value       = local.config.instance_type
}
