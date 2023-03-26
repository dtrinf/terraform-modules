# AWS Records Creation Terraform module

Terraform module used to create security groups.

## Usage

### Security group creation

Security group creation:

```hcl
terraform {
  source = "git::git@github.com:dtrinf/terraform-modules.git//networking/security_group?ref=${local.client.locals.terraform_modules_version}"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  name   = basename(get_original_terragrunt_dir())
  vpc_id = dependency.vpc.outputs.vpc_id
  inbound_rules = [{
    cidr_ipv4      = "0.0.0.0/0"
    cidr_ipv6      = ""
    description    = "Allow all SSH traffic"
    from_port      = 22
    ip_protocol    = "tcp"
    prefix_list_id = ""
    to_port        = 22
  }]
}

```


## Assumptions


## Notes

