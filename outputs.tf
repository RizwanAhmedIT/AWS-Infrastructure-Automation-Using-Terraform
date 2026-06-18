output "aws_region" {
  value = var.aws_region
}
output "project_name" {
  value = var.project_name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}