terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.0.1"
}