#####################################
# Elastic Container Registry
#####################################

resource "aws_ecr_repository" "healthcare_app" {

  name                 = "healthcare-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {

    scan_on_push = true
  }

  encryption_configuration {

    encryption_type = "AES256"
  }

}