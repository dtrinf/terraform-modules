# AWS Records Creation Terraform module

Terraform module used to create SSH keys.

## Usage

### Record creation

Record creation:

```hcl
terraform {
  source = "git::git@github.com:dtrinf/terraform-modules.git//security/ssh_key_pair?ref=${local.client.locals.terraform_modules_version}"
}
```


## Assumptions


## Notes

