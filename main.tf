module "vpc" {
  source       = "./modules/vpc"
  aws_region   = var.aws_region
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "security_groups" {
  source       = "./modules/security-groups"
  project_name = var.project_name
  vpc_id      = module.vpc.vpc_id
}