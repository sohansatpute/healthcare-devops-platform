###################################
# EC2 Public IP
###################################

# output "ec2_public_ip" {

#   description = "Public IP of EC2"
#   value       = aws_instance.app_server.public_ip

# }

# ###################################
# # EC2 Public DNS
# ###################################

# output "ec2_public_dns" {

#   description = "Public DNS of EC2"
#   value       = aws_instance.app_server.public_dns

# }

###################################
# ALB Public DNS
###################################

output "alb_dns_name" {

  description = "Application Load Balancer DNS Name"
  value       = aws_lb.app_alb.dns_name

}

###################################
# ALB ARN
###################################

output "alb_arn" {

  description = "ALB ARN"
  value       = aws_lb.app_alb.arn

}

###################################
# ALB Target Group ARN
###################################

output "target_group_arn" {

  description = "Application Target Group ARN"
  value       = aws_lb_target_group.app_tg.arn

}

#####################################
# Elastic Container Registry
#####################################

output "aws_ecr_repository_url" {

  description = "Amazon ECR Repository URL"
  value       = aws_ecr_repository.healthcare_app.repository_url

}

output "ecr_repository_name" {

  description = "Amazon ECR Repository Name"
  value       = aws_ecr_repository.healthcare_app.name

}

output "Jenkins_public_IP" {

  description = "Public IP of Jenkins server"
  value       = aws_instance.jenkins_server.public_ip

}

output "jenkins_url" {

  description = "Jenkins Web url"
  value       = "http://${aws_instance.jenkins_server.public_ip}:8080"

}