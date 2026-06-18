output "cluster_name" {
  value = aws_ecs_cluster.main.name
}
output "cluster_id" {
  value = aws_ecs_cluster.main.id
}
output "ecs_service" {
  value = aws_ecs_service.app.name
}
