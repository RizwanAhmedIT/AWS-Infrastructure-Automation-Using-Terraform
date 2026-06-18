output "aws_region" {
  value = var.aws_region
}
output "project_name" {
  value = var.project_name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "db_endpoint" {
  value = module.rds.db_endpoint
}
output "db_instance_id" {
  value = module.rds.db_instance_id
}
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}