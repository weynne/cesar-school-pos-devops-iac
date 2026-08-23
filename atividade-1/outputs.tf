# What the project exposes after an apply: the address to reach the page and
# the context that makes each run's log self-identifying.

output "instance_public_ip" {
  description = "Public IP address of the web server instance"
  value       = module.web_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the web server instance"
  value       = module.web_server.public_dns
}

output "web_url" {
  description = "URL to open in a browser to reach the published page"
  value       = "http://${module.web_server.public_ip}"
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
