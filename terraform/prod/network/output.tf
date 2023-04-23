output "public_subnets_id" {
  value = module.vpc.public_subnets_id
}

output "private_subnets_id" {
  value = module.vpc.private_subnets_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_route_table_id" {
  value = module.vpc.public_subnets_route_table_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}