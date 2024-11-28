
resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = var.user_data
  tags = {
    Name = "${var.identifier}-${var.name_instance}-${terraform.workspace}"
  }
}