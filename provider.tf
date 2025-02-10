# provider.tf
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "ann94-terraform-state-bucket" # Thay đổi tên bucket
    key            = "state/terraform.tfstate"
    region         = "ap-southeast-1" # Thay đổi region nếu cần
    encrypt        = true
    dynamodb_table = "terraform-state-lock" # Tạo bảng DynamoDB với tên này
  }

  required_version = ">= 1.0.0"
}