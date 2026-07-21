provider "aws" {
  region = var.aws_region

  default_tags {

    tags = {

      project_name = var.project_name

      Environment = var.environment

      ManagedBy = "Terraform"

      Owner = "Sohan"

    }

  }


}