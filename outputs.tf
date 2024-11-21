
output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets_ids" {
  description = "The VPC ID"
  value       = module.vpc.public_subnets_ids
}

output "public_ec2_sg_id" {
   description = "public-ec2-sg id"  
   value = module.security_groups.public_ec2_sg_id
}

# output "public_ip_ec2" {
#   value = module.ec2.public_ip_ec2
# }

