#security group using list of object 
# resource "aws_security_group" "SG" {
#   for_each = { for i in var.security_groups : i.name => i }

#   vpc_id = var.vpc_id
#   tags = {
#     Name = "${var.identifier}-${each.key}-${terraform.workspace}"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


# ingress rules using list of objects
# resource "aws_security_group_rule" "ingress_rules" {
#   for_each = { 
#     for sg in var.security_groups : sg.name => sg.ingress_rules
#   }

#   type              = "ingress"
#   security_group_id = aws_security_group.SG[each.key].id

#   cidr_blocks = [each.value[0].cidr_block]
#   from_port   = each.value[0].from_port
#   to_port     = each.value[0].to_port
#   protocol    = each.value[0].protocol
# }


#security group using map of object 
resource "aws_security_group" "SG" {
  for_each = var.security_groups

  vpc_id = var.vpc_id
  tags = {
    Name = "${var.identifier}-${each.key}-${terraform.workspace}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = { for sg_name, sg in var.security_groups : sg_name => sg.ingress_rules }

  type              = "ingress"
  security_group_id = aws_security_group.SG[each.key].id  
# cidr_blocks = [each.value[0].cidr_block]  
  cidr_blocks = [for rule in each.value : rule.cidr_block]  
  from_port   = each.value[0].from_port 
  to_port     = each.value[0].to_port
  protocol    = each.value[0].protocol
}