provider "aws" {
  region = "us-west-1"
}
terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket         = "alfa-s3-project-main"
    key            = "alfa-s3-project-main/backend/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "Porject_alfa"
  }
}