output "public_ip" {
  value = aws_instance.app_server[*].public_ip
}

output "private_ip" {
  value = aws_instance.app_server[*].private_ip
}

