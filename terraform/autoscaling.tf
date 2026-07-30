########################################
# Auto Scalling Group
########################################


resource "aws_autoscaling_group" "app_asg" {

  name             = "healthcare-app-asg"
  desired_capacity = 1
  min_size         = 1
  max_size         = 2

  vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {

    id      = aws_launch_template.app_template.id
    version = "$Latest"

  }

  tag {

    key                 = "Name"
    value               = "Healthcare-ASG-Instance"
    propagate_at_launch = true

  }

}