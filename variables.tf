variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project for tagging resources."
  type        = string
  default     = "my-terraform-project-ecs-app"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "db_name" {
  description = "The name of the RDS database."
  type        = string
}
variable "db_username" {
  description = "The username for the RDS database."
  type        = string
}
variable "db_password" {
  description = "The password for the RDS database."
  type        = string
  sensitive   = true
}