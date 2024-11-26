output "security_group_ids" {
  description = "The IDs of the created security groups"
  value = { for sg_name, sg in aws_security_group.sg : sg_name => sg.id }
}
