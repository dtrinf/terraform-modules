# AWS DNS Zone creation Terraform module

Terraform module used to create VPCs.

## Usage

### DNS Zone Creation

DNS Zone Creation:

```hcl
terraform {
  source = "git::git@github.com:dtrinf/terraform-modules.git//networking/route53/zones?ref=${local.client.locals.terraform_modules_version}"
}

include {
  path = find_in_parent_folders()
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  client      = read_terragrunt_config(find_in_parent_folders("client.hcl"))
}


inputs = {

  domain = local.client.locals.domain

  zones = {
    (local.client.locals.domain) = {
      tags = {
        env = local.environment.locals.environment
      }
    }
  }
}
```

### DNS Zone Import

If the DNS Zone is already created, you can import it.

```sh
terragrunt import 'module.zones.aws_route53_zone.this["DomainName"]' 'Zone ID'
```


## Assumptions

It has no requirements.

## Notes

