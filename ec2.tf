resource "aws_instance" "ec2-server" {
  count         = 4
  ami           = var.ami
  instance_type = var.tipo_instancia
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.sg_acesso_ssh_publico.id, aws_security_group.sg_acesso_web.id, aws_security_group.sg_acesso_web_81.id, aws_security_group.sg_acesso_docker.id]
}

resource "aws_instance" "ec2-ansible" {
  count         = 1
  ami           = var.ami
  instance_type = var.tipo_instancia
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-ansible-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.sg_acesso_ssh_publico.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
  EOF
}
