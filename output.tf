output "instancias-ec2_docker" {
  value = aws_instance.ec2-server.*.public_ip
}

output "instancias-ec2-ansible" {
  value = aws_instance.ec2-ansible.*.public_ip
}

output "instancias-ec2-private" {
  value = aws_instance.ec2-server.*.private_ip
}
