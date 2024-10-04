provider "aws" { 
    region = var.AWS_REGION
    #profile = "terraform"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"     }
  }
}

