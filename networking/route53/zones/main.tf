provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
}

module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = var.zones

  tags = {
    ManagedBy = "Terraform"
  }
}

