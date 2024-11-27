
output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets_ids" {
  description = "The VPC ID"
  value       = module.vpc.public_subnets_ids
}


output "security_group_1_id" {
  description = "The IDs of the created security groups"
  value = module.security_group_1.security_group_id
}

output "security_group_2_id" {
  description = "The IDs of the created security groups"
  value = module.security_group_2.security_group_id
}