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

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "ecs" {
  source                = "./modules/ecs"
  project_name          = var.project_name
  private_subnet_a      = module.vpc.private_subnet_a
  private_subnet_b      = module.vpc.private_subnet_b
  ecs_sg_id             = module.security_groups.ecs_sg_id
  instance_profile_name = module.iam.ecs_instance_profile_name
  target_group_arn      = module.alb.ecs_target_group_arn
}

module "rds" {
  source           = "./modules/rds"
  project_name     = var.project_name
  private_subnet_a = module.vpc.private_subnet_a
  private_subnet_b = module.vpc.private_subnet_b
  rds_sg_id        = module.security_groups.rds_sg_id
  db_name          = var.db_name
  db_username      = var.db_username
  db_password      = var.db_password
}