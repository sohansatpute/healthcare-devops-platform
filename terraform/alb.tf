############################
#ALB Target Group
############################


resource "aws_lb_target_group" "app_tg" {

  name     = "healthcare-app-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.healthcare_vpc.id

  health_check {

    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2

  }

  tags = {
    "Name" = "Healthcare App Target Group"
  }

}

############################
#Application Load Balancer
############################

resource "aws_lb" "app_alb" {

  name               = "healthcare-app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]

  subnets = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  enable_deletion_protection = false

  tags = {
    "Name" = "Healthcare Application Load Balancer"
  }


}


############################
#Load Balancer Listener
############################

resource "aws_lb_listener" "http_listener" {

  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }

}

############################
#Target Group Attachment
############################

resource "aws_lb_target_group_attachment" "app_server" {

  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.app_server.id
  port             = 80

}
