variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "zones" {
  description = "Zones Name."
  type        = any
  default     = {}
}

variable "tags" {
  description = "Zone tags."
  type        = map(string)
  default     = null
}
