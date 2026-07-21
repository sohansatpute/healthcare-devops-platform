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