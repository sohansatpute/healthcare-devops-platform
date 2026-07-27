##########################
#VPC
##########################

resource "aws_vpc" "healthcare_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }

}


##########################
#Internet Gateway
##########################

resource "aws_internet_gateway" "healthcare_igw" {
  vpc_id = aws_vpc.healthcare_vpc.id

  tags = {

    Name = "${var.project_name}-${var.environment}-igw"
  }

}

##########################
#Public Subnet
##########################

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.healthcare_vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.availability_zone_1

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-1"
  }

}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.healthcare_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.availability_zone_2

  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.project_name}-${var.environment}-public-subnet-2"
  }

}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.healthcare_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zone_1

  tags = {
    "Name" = "${var.project_name}-${var.environment}-private-subnet-1"
  }

}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.healthcare_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zone_2

  tags = {
    "Name" = "${var.project_name}-${var.environment}-private-subnet-2"
  }

}

###############################
##Public Route Table
###############################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.healthcare_vpc.id

  tags = {
    "Name" = "${var.project_name}-${var.environment}-public-rt"
  }

}

###############################
##Default Route to Internet
###############################

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.healthcare_igw.id

}

###############################
##Public Subnet Association
###############################

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id

}

###############################
##Private Route Table
###############################

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.healthcare_vpc.id

  tags = {

    Name = "${var.project_name}-${var.environment}-private-rt"
  }



}

###############################
##Private Subnet Association
###############################

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private.id

}