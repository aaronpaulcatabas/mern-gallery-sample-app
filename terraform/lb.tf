resource "aws_lb" "backend_lb" {
  name               = "backend-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private.id]
}

resource "aws_lb_target_group" "backend_tg" {
  name        = "backend-tg"
  port        = 5000
  protocol    = "TCP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
}

resource "aws_lb_listener" "backend_listener" {
  load_balancer_arn = aws_lb.backend_lb.arn
  port              = 5000
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg.arn
  }
}