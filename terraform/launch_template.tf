###################################
# Auto Scalling Launch Template
###################################


resource "aws_launch_template" "app_template" {

  name_prefix            = "healthcare-app-"
  image_id               = data.aws_ami.amazon_linux.id
  instance_type          = var.application_instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {

    resource_type = "instance"

    tags = {
      "Name" = "Healthcare-app"
    }


  }

}