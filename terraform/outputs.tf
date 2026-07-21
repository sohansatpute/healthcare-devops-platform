output "availability_zones" {

  description = "Available AWS Availability Zones"

  value = data.aws_availability_zones.available.names

}