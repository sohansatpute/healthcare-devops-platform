variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
  default     = "ap-south-1"

}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "healthcare-devops"

}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"

}

############################
# Networking
############################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}

variable "public_subnet_1_cidr" {
  description = "CIDR block for Public Subnet 1"
  type        = string
  default     = "10.0.1.0/24"

}

variable "public_subnet_2_cidr" {
  description = "CIDR block for Public Subnet 2"
  type        = string
  default     = "10.0.2.0/24"

}

variable "private_subnet_1_cidr" {
  description = "CIDR block for Private Subnet 1"
  type        = string
  default     = "10.0.11.0/24"

}

variable "private_subnet_2_cidr" {
  description = "CIDR block for Private Subnet 2"
  type        = string
  default     = "10.0.12.0/24"

}

variable "availability_zone_1" {
  description = "Primary AZ"
  type        = string
  default     = "ap-south-1a"

}

variable "availability_zone_2" {
  description = "Secondary AZ"
  type        = string
  default     = "ap-south-1b"

}

###################################
# EC2 AMI
###################################

variable "ami_name_filter" {

  description = "Amazon Linux 2023 AMI name filter"
  type        = string
  default     = "al2023-ami-*-x86_64"

}

###################################
# EC2 Configuration
###################################

variable "instance_type" {

  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"

}

variable "key_pair_name" {

  description = "AWS EC2 Key Pair Name"
  type        = string

}

###################################
# ACM Certificate
###################################

variable "acm_certificate_arn" {

  description = "ARN of the ACM certificate"
  type        = string

}