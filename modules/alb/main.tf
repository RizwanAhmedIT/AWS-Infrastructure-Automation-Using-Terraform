resource "aws_lb" "main" {
  name = "${var.project_name}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.alb_sg_id]
  subnets = [var.public_subnet_a, var.public_subnet_b]
  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_lb_target_group" "ecs" {
    name = "${var.project_name}-ecs-tg"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = var.vpc_id
    health_check {
        path = "/"
        protocol = "HTTP"
        healthy_threshold = 2
        unhealthy_threshold = 2
        interval = 30
    }
}