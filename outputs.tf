output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.mongo_instance.id
}

output "public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.mongo_instance.public_ip
}

output "security_group_name" {
  description = "Nome do Security Group associado à instância"
  value       = aws_security_group.sg-rds.name
}