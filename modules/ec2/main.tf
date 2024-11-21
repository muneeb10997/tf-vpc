
resource "aws_instance" "public_ec2" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  key_name = "public-key"
  subnet_id = var.public_subnets_ids[0]
  security_groups = [var.public_ec2_sg_id]
#   associate_public_ip_address = true
  tags = {
    Name = "${var.identifier}-ec2-${terraform.workspace}"

  }
 }

# resource "aws_instance" "application_es2" {
#   subnet_id =
#   ami = 
#   instance_type = 
# }

# resource "aws_instance" "data_ec2" {
#   subnet_id =
#   ami = 
#   instance_type = 
# }