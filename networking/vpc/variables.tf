variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "vpc_name" {
  description = "VPC Name."
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment."
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "region" {
  description = "VPC Region."
  type        = string
  default     = ""
}

variable "azs" {
  description = "VPZ AZS."
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Enable one NatGateway in all Private subnets."
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Enable Single shared NAT Gateway"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC."
  type        = bool
  default     = true
}

variable "custom_private_subnet_tags" {
  description = "Custom private subnet tags"
  type        = map(string)
  default     = null
}

variable "custom_public_subnet_tags" {
  description = "Custom public subnet tags"
  type        = map(string)
  default     = null
}

variable "custom_common_tags" {
  description = "Custom common tags"
  type        = map(string)
  default     = null
}
