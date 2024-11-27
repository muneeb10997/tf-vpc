# Define the security group with for_each
resource "aws_security_group" "sg" {
  description = "Security group for ${var.security_group_name}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.identifier}-${var.security_group_name}-${terraform.workspace}"
  }
}

# Dynamic Ingress Rules
resource "aws_security_group_rule" "ingress" {
  count = length(var.ingress_rules)

  type                     = "ingress"
  security_group_id        = aws_security_group.sg.id
  protocol                 = var.ingress_rules[count.index].protocol
  from_port                = var.ingress_rules[count.index].from_port
  to_port                  = var.ingress_rules[count.index].to_port
  cidr_blocks              = var.ingress_rules[count.index].cidr_blocks !=  [ ] ? var.ingress_rules[count.index].cidr_blocks : null
  source_security_group_id = var.ingress_rules[count.index].source_security_group_id == "" ? var.ingress_rules[count.index].source_security_group_id : null
}

# Dynamic Egress Rules
resource "aws_security_group_rule" "egress" {
  count = length(var.egress_rules)

  type              = "egress"
  security_group_id = aws_security_group.sg.id
  protocol          = var.egress_rules[count.index].protocol
  from_port         = var.egress_rules[count.index].from_port
  to_port           = var.egress_rules[count.index].to_port
  cidr_blocks       = var.egress_rules[count.index].cidr_blocks
}

#   # Ingress rules
#   dynamic "ingress" {
#     for_each = each.value.ingress_rules
#     content {
#       from_port   = ingress.value.from_port
#       to_port     = ingress.value.to_port
#       protocol    = ingress.value.ip_protocol

#       cidr_blocks       = ingress.value.cidr_ipv4 != null ? [ingress.value.cidr_ipv4] : []
#       security_groups   = ingress.value.source_sg_id != null ? [ingress.value.source_sg_id] : []
#     }
#   }

#   # Egress rules
#   dynamic "egress" {
#     for_each = each.value.egress_rules
#     content {
#       from_port   = egress.value.from_port
#       to_port     = egress.value.to_port
#       protocol    = egress.value.ip_protocol

#       cidr_blocks       = egress.value.cidr_ipv4 != null ? [egress.value.cidr_ipv4] : []
#       security_groups   = egress.value.destination_sg_id != null ? [egress.value.destination_sg_id] : []
#     }
#   }

#   tags = {
#     Name = "${var.identifier}-${each.key}-${terraform.workspace}"
#   }
# }