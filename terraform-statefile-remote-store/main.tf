resource "random_pet" "terraform_state_bucket" {
  prefix = "lambda"
  length = 2

}

terraform {
    # Make sure the bucket being reference has already been created
    # To enambe state locking make sure the DynamoDB Table has already been created if using AWS provider
    backend "s3" {
        bucket = "terraform_state_bucket_falenyoni"
        region = "us-east-1"
        key = "terraform.tfstate"        
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket        = random_pet.terraform_state_bucket.id
  force_destroy = true
}