#public security group
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

resource "aws_security_group_rule" "ingress_rules_public" {
  type              = "ingress"
  security_group_id = aws_security_group.public_ec2_sg.id
  count      = "${length(var.ingress_cidr_blocks_public)}"
  cidr_blocks = [var.ingress_cidr_blocks_public[count.index]]
  from_port = "${var.ingress_from_ports_public[count.index]}"  
  to_port = "${var.ingress_to_ports_public[count.index]}"  
  protocol = "${var.ingress_protocols_public[count.index]}"  
  }

#application security group
resource "aws_security_group" "application_ec2_sg" {
   vpc_id = var.vpc_id
   tags = {
     Name = "${var.identifier}-application_ec2_sg-${terraform.workspace}"
   } 
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_security_group_rule" "ingress_rules_application" {
  type              = "ingress"
  security_group_id = aws_security_group.application_ec2_sg.id
  count      = "${length(var.ingress_cidr_blocks_application)}"
  cidr_blocks = [var.ingress_cidr_blocks_application[count.index]]
  from_port = "${var.ingress_from_ports_application[count.index]}"  
  to_port = "${var.ingress_to_ports_application[count.index]}"  
  protocol = "${var.ingress_protocols_application[count.index]}"
  # source_security_group_id = aws_security_group.public_ec2_sg.id
  }

# data security group
resource "aws_security_group" "data_ec2_sg" {
   vpc_id = var.vpc_id
   tags = {
     Name = "${var.identifier}-data_ec2_sg-${terraform.workspace}"
   } 
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_security_group_rule" "ingress_rules_data" {
  type              = "ingress"
  security_group_id = aws_security_group.data_ec2_sg.id
  count      = "${length(var.ingress_cidr_blocks_data)}"
  cidr_blocks = [var.ingress_cidr_blocks_data[count.index]]
  from_port = "${var.ingress_from_ports_data[count.index]}"  
  to_port = "${var.ingress_to_ports_data[count.index]}"  
  protocol = "${var.ingress_protocols_data[count.index]}"  
  }
 # security_group_id = aws_security_group.public_ec2_sg.id
  # cidr_ipv4 = var.cidr_ipv4_http
  # from_port = 80
  # ip_protocol = "tcp"
  # to_port = 80

# resource "aws_vpc_security_group_ingress_rule" "HTTPS" {
#   security_group_id = aws_security_group.public_ec2_sg.id
#   cidr_ipv4 = var.cidr_ipv4_https
#   from_port = 443
#   ip_protocol = "tcp"
#   to_port = 443
# }

# resource "aws_vpc_security_group_ingress_rule" "SSH" {
#   security_group_id = aws_security_group.public_ec2_sg.id
#   cidr_ipv4 = var.cidr_ipv4_ssh
#   from_port = 22
#   ip_protocol = "tcp"
#   to_port = 22
# }