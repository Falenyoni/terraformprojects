terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.21.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.3.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~>2.4.0"
    }
  }
  required_version = "~>1.0"
}

provider "aws" {
  region = "us-east-1"

  ## Use below if using localstake
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true

    endpoints {    
    iam            = "http://localhost:4566"   
    lambda         = "http://localhost:4566"
  }
}