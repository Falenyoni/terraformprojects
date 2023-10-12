provider "aws" {
  region = "us-east-1"
}

## Create VPC 
resource "aws_vpc"  "three-tier-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}
# Check the az
data "aws_availability_zone" "myazs" {
  
}
