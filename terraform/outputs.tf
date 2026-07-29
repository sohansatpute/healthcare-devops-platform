###################################
# EC2 Public IP
###################################

output "ec2_public_ip" {

  description = "Public IP of EC2"
  value       = aws_instance.app_server.public_ip

}

###################################
# EC2 Public DNS
###################################

output "ec2_public_dns" {

  description = "Public DNS of EC2"
  value       = aws_instance.app_server.public_dns

}