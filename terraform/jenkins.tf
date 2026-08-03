###########################################
# Jenkins Security Group
###########################################

resource "aws_security_group" "jenkins_sg" {

  name        = "jenkins-sg"
  description = "Security group for Jenkins Server"
  vpc_id      = aws_vpc.healthcare_vpc.id

  ingress {

    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "Jenkins"

    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    "Name" = "Jenkins Security Group"
  }

}

###########################################
# Jenkins Instance
###########################################

resource "aws_instance" "jenkins_server" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.jenkins_instance_type

  subnet_id = aws_subnet.public_subnet_1.id

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  key_name = var.key_pair_name

  user_data = file("${path.module}/jenkins_userdata.sh")

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  root_block_device {

    volume_size = var.jenkins_root_volume_size
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    "Name" = "Healthcare Jenkins Server"
  }

}