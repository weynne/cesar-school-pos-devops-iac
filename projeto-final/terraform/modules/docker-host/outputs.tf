output "instance_id" {
  description = "The ID of the docker host instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "The public IP address of the docker host instance"
  value       = aws_instance.this.public_ip
}

output "public_dns" {
  description = "The public DNS name of the docker host instance"
  value       = aws_instance.this.public_dns
}

output "security_group_id" {
  description = "The ID of the security group attached to the docker host"
  value       = aws_security_group.this.id
}
