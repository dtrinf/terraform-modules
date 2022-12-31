provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = var.records

}

