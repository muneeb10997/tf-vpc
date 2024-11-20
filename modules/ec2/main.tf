# resource "aws_security_group" "public_ec2_sg" {
#   vpc_id = aws_vpc.vpc.id
#   ingress = [

#   ]
#   egress = [

#   ]
# }

# resource "aws_key_pair" "public_ec2_key_pair" {
#   key_name = "ec2_key.pem"
#  # https://stackoverflow.com/questions/49743220/how-to-create-an-ssh-key-in-terraform

# }
# resource "aws_instance" "public_ec2" {
#   ami =
#   instance_type = 
#   key_name = 
#   subnet_id = 
#   security_groups = aws_security_group.public_ec2_sg.id
#   tags = {
#     Name =
#   }
#  }

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