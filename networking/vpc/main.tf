provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
  private_subnet_tags = var.custom_private_subnet_tags != null ? var.custom_private_subnet_tags : local.private_subnet_tags_default
  public_subnet_tags  = var.custom_public_subnet_tags != null ? var.custom_public_subnet_tags : local.public_subnet_tags_default
  common_tags         = var.custom_common_tags != null ? var.custom_common_tags : local.common_tags_default
  # default tags
  common_tags_default = {
    Terraform   = "true"
    Environment = var.environment
  }
  private_subnet_tags_default = {
    Private = "true",
  }
  public_subnet_tags_default = {
    Private = "false",
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("VPC-%s", var.environment)
  cidr = var.vpc_cidr

  azs             = var.region != "" ? [format("%sa", var.region), format("%sb", var.region), format("%sc", var.region)] : var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = var.enable_dns_hostnames

  private_subnet_tags = local.private_subnet_tags
  public_subnet_tags  = local.public_subnet_tags
  tags                = local.common_tags
}

