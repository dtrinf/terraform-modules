provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
}

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "~> 2.0"

  key_name        = var.key_name
  key_name_prefix = var.key_name_prefix

  public_key = var.custom_public_key ? var.public_key : tls_private_key.this.public_key_openssh

  create = var.create

  tags = var.tags
}


resource "tls_private_key" "this" {
  algorithm = "RSA"
}
