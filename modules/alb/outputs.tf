output "alb_dns_name" {
  value = aws_lb.main.dns_name
}
output "ecs_target_group_arn" {
  value = aws_lb_target_group.ecs.arn
}