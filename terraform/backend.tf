###########################################
# Store Terraform state file to S3
###########################################


terraform {

  backend "s3" {

    bucket         = "sohansatpute-healthcare-tfstate"
    key            = "healthcare-devops/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = true
    encrypt        = true

  }
}