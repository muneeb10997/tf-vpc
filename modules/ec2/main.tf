
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type =var.instance_type
  key_name      =var.key_name
  subnet_id     =var.subnet_id
  security_groups =var.security_groups
  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name = "${var.identifier}-${var.name}-${terraform.workspace}"
  }
}