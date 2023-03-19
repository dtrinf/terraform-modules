variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "create_key_pair" {
  description = "Controls if key pair should be created"
  type        = bool
  default     = true
}

variable "custom_public_key" {
  description = "Controls if key pair should be created"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "The name for the key pair."
  type        = string
  default     = null
}

variable "key_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with key_name."
  type        = string
  default     = null
}

variable "public_key" {
  description = "The public key material."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to key pair resource."
  type        = map(string)
  default     = {}
}
