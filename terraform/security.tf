###################################
# ALB Security Group
###################################


resource "aws_security_group" "alb_sg" {

  name        = "${var.project_name}-${var.environment}-alb-sg"
  description = "Security Group for Application Load Balancer"

  vpc_id = aws_vpc.healthcare_vpc.id

  ingress {

    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.project_name}-${var.environment}-alb-sg"
  }

}


###################################
# Application Security Group
###################################

resource "aws_security_group" "app_sg" {

  name        = "${var.project_name}-${var.environment}-app-sg"
  description = "Security Group for Application"

  vpc_id = aws_vpc.healthcare_vpc.id

  ingress {

    description = "HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    security_groups = [
      aws_security_group.alb_sg.id
    ]
  }

  ingress {

    description = "SSH added temporary"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.213.82.207/32"]

  }

  egress {

    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-app-sg"
  }

}

###################################
# Database Security Group
###################################

resource "aws_security_group" "db-sg" {

  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Security Group for Database"

  vpc_id = aws_vpc.healthcare_vpc.id

  ingress {

    description = "MySQL from Application"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"

    security_groups = [aws_security_group.app_sg.id]
  }

  egress {

    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.project_name}-${var.environment}-db-sg"
  }

}