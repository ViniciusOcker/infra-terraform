output "instancias_a2" {
  value = aws_instance.server.*.public_ip
}

output "instancias_a2_private" {
  value = aws_instance.server.*.private_ip
}
