###################################
# Jenkins Role
###################################

resource "aws_iam_role" "jenkins_role" {

  name = "${var.project_name}-${var.environment}-jenkins-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"

      }

    ]

  })

}

###################################
# Jenkins Instance Profile
###################################

resource "aws_iam_instance_profile" "jenkins_profile" {

  name = "${var.project_name}-${var.environment}-jenkins-profile"
  role = aws_iam_role.jenkins_role.name

}

###################################
# Jenkins Policy attach
###################################

resource "aws_iam_role_policy_attachment" "jenkins_ecr" {

  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"

}

resource "aws_iam_policy" "jenkins_ssm_policy" {

  name = "${var.project_name}-${var.environment}-jenkins-ssm-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "ssm:SendCommand",
          "ssm:GetCommandInvocation",
          "ssm:ListCommandInvocations",
          "ssm:DescribeInstanceInformation",
          "ssm:ListCommands",
          "ec2:DescribeInstances"

        ]

        Resource = "*"

      }

    ]

  })

}


resource "aws_iam_role_policy_attachment" "jenkins_ssm" {

  role       = aws_iam_role.jenkins_role.name
  policy_arn = aws_iam_policy.jenkins_ssm_policy.arn

}