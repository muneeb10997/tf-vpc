resource "aws_security_group" "public_ec2_sg" {
   vpc_id = var.vpc_id
   tags = {
     Name = "${var.identifier}-public_ec2_sg-${terraform.workspace}"
   } 
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
  security_group_id = aws_security_group.public_ec2_sg.id
  cidr_ipv4 = var.cidr_ipv4_http
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "HTTPS" {
  security_group_id = aws_security_group.public_ec2_sg.id
  cidr_ipv4 = var.cidr_ipv4_https
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443
}

resource "aws_vpc_security_group_ingress_rule" "SSH" {
  security_group_id = aws_security_group.public_ec2_sg.id
  cidr_ipv4 = var.cidr_ipv4_ssh
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}
# ingress {
#    description = "HTTPS ingress"
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  ingress {
#    description = "HTTP ingress"
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

# ingress {
#    description = "SSH ingress"
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  egress {
#   from_port   = 0
#   to_port     = 0
#   protocol    = "-1"
#   cidr_blocks = ["0.0.0.0/0"]
# }