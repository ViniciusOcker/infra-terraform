resource "aws_instance" "server" {
  count         = 2
  ami           = var.ami
  instance_type = var.tipo_instancia
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.sg_acesso_ssh_publico.id, aws_security_group.sg_acesso_web.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
  EOF
}