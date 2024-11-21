output "public_ip_ec2" {
  value = aws_instance.public_ec2.public_ip
}
