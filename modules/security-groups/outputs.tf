output "public_ec2_sg_id" {
   description = "public-ec2-sg id"  
   value = aws_security_group.public_ec2_sg.id
}