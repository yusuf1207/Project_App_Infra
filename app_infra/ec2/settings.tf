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
    bucket         = "alfa1-uw1-tf-bucket"
    key            = "app_infra/ec2/backend/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "Porject_alfa"
  }
}