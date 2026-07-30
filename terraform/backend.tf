###########################################
# Store Terraform state file to S3
###########################################


terraform {

  backend "s3" {

    bucket         = "sohansatpute-terraform-state"
    key            = "healthcare-devops/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true

  }
}