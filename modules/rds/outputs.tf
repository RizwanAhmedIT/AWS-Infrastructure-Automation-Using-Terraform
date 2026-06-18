output "db_endpoint" {
  value = aws_db_instance.postgress.endpoint
}
output "db_instance_id" {
  value = aws_db_instance.postgress.id
}