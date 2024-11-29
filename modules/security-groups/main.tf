# Define the security group with count
resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  name   = "${var.identifier}-${var.security_group_name}-${terraform.workspace}"
  tags = {
    Name = "${var.identifier}-${var.security_group_name}-${terraform.workspace}"
  }
}

# Dynamic Rules
resource "aws_security_group_rule" "rules" {
  count                    = length(var.rules)
  security_group_id        = aws_security_group.sg.id
  type                     = var.rules[count.index].type
  protocol                 = var.rules[count.index].protocol
  from_port                = var.rules[count.index].from_port
  to_port                  = var.rules[count.index].to_port
  cidr_blocks              = var.rules[count.index].cidr_blocks
  source_security_group_id = var.rules[count.index].source_security_group_id == "" ? var.source_security_group_id : null
}