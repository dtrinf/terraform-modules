# AWS Records Creation Terraform module

Terraform module used to create DNS Records.

## Usage

### Record creation

Record creation:

```hcl
terraform {
  source = "git::git@github.com:dtrinf/terraform-modules.git//networking/route53/records?ref=${local.client.locals.terraform_modules_version}"
}

include {
  path = find_in_parent_folders()
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  client      = read_terragrunt_config(find_in_parent_folders("client.hcl"))
}

dependency "dns_zone" {
  config_path = "../zones"
}


inputs = {

  zone_name = dependency.dns_zone.outputs.route53_zone_name[local.client.locals.domain]

  records = [
    {
      name = "apigateway1"
      type = "A"
      ttl  = 60
      records = [
        "10.10.10.10",
      ]
    },
    {
      name = "test"
      type = "A"
      ttl  = 3600
      records = [
        "10.10.10.10",
      ]
    },
  ]
}
```


## Assumptions

The domain already exists.

## Notes

