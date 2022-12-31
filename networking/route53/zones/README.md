# AWS VPC Terraform module

Terraform module used to import manualy registered Domain.

## Usage

### Domain Import

Domain Import:

```hcl
terraform {
  source = "git::git@github.com:dtrinf/terraform-modules.git//networking/vpc?ref=v1.0.1"
}

include {
  path = find_in_parent_folders()
}

locals {
  client      = read_terragrunt_config(find_in_parent_folders("client.hcl"))
  datacenter  = read_terragrunt_config(find_in_parent_folders("datacenter.hcl"))
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
}

inputs = {
  vpc_cidr        = local.client.locals[local.environment.locals.environment].network.vpc_cidr
  private_subnets = local.client.locals[local.environment.locals.environment].network.private_subnets
  public_subnets  = local.client.locals[local.environment.locals.environment].network.public_subnets
  region          = local.datacenter.locals.aws_region
  environment     = local.environment.locals.environment
}
```


## Assumptions

The domain has been manually created.

## Notes

