output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC."
  value       = module.vpc.vpc_arn
}

output "public_subnet_arns" {
  description = "Public subnets ARN."
  value       = module.vpc.public_subnet_arns
}

output "private_subnet_arns" {
  description = "Private subnets ARN."
  value       = module.vpc.private_subnet_arns
}

output "public_subnet_ids" {
  description = "Public subnets IDs."
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnets IDs."
  value       = module.vpc.private_subnets
}

output "private_route_table_ids" {
  description = "Private route table IDs."
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "Public route table IDs."
  value       = module.vpc.public_route_table_ids
}

output "vpc_main_route_table_id" {
  description = "VPC main route table ID."
  value       = module.vpc.vpc_main_route_table_id
}