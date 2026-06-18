module "vpc" {
  source       = "./modules/vpc"
  aws_region   = var.aws_region
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "security_groups" {
  source       = "./modules/security-groups"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "alb" {
  source          = "./modules/alb"
  project_name    = var.project_name
  vpc_id          = module.vpc.vpc_id
  public_subnet_a = module.vpc.public_subnet_a
  public_subnet_b = module.vpc.public_subnet_b
  alb_sg_id       = module.security_groups.alb_sg_id
}