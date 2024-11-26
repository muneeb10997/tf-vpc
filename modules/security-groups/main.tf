# Define the security group with for_each
resource "aws_security_group" "sg" {
  for_each = var.security_groups
  name     = each.key
  vpc_id   = var.vpc_id

  # Ingress rules
  dynamic "ingress" {
    for_each = each.value.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.ip_protocol

      # Add either CIDR block or source security group
      cidr_blocks       = ingress.value.cidr_ipv4 != null ? [ingress.value.cidr_ipv4] : []
      security_groups   = ingress.value.source_sg_id != null ? [ingress.value.source_sg_id] : []
    }
  }

  # Egress rules
  dynamic "egress" {
    for_each = each.value.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.ip_protocol

      # Add either CIDR block or destination security group
      cidr_blocks       = egress.value.cidr_ipv4 != null ? [egress.value.cidr_ipv4] : []
      security_groups   = egress.value.destination_sg_id != null ? [egress.value.destination_sg_id] : []
    }
  }
  
  tags = {
    Name = "${var.identifier}-${each.key}-${terraform.workspace}"
  }
}