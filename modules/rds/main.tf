resource "aws_db_subnet_group" "postgress" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = [var.private_subnet_a, var.private_subnet_b]
  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}
resource "aws_db_instance" "postgress" {
  identifier              = "${var.project_name}-db-instance"
  engine                  = "postgres"
  engine_version          = "16"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.postgress.name
  vpc_security_group_ids  = [var.rds_sg_id]
  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 1
}