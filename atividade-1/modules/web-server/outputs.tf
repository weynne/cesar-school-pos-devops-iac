output "instance_id" {
  description = "The ID of the web server instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "The public IP address of the web server instance"
  value       = aws_instance.this.public_ip
}

output "public_dns" {
  description = "The public DNS name of the web server instance"
  value       = aws_instance.this.public_dns
}

output "security_group_id" {
  description = "The ID of the security group attached to the web server"
  value       = aws_security_group.this.id
}

