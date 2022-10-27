resource "aws_key_pair" "terraform_aws" {
  key_name   = "${var.usuario}-terraform-aws"
  public_key = file("terraform-aws.pub")
}