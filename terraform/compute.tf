###################################
# Get Latest Amazon Linux 2023 AMI
###################################

data "aws_ami" "amazon_linux" {

  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = [var.ami_name_filter]

  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]

  }

}

###################################
# EC2 Instance
###################################

# resource "aws_instance" "app_server" {

#   ami                    = data.aws_ami.amazon_linux.id
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public_subnet_1.id
#   vpc_security_group_ids = [aws_security_group.app_sg.id]
#   iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
#   key_name               = var.key_pair_name

#   associate_public_ip_address = true

#   user_data = file("${path.module}/user_data.sh")

#   tags = {
#     "Name" = "${var.project_name}-${var.environment}-app-server"
#   }

# }