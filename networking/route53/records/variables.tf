variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "zone_name" {
  description = "Zones Name."
  type        = string
  default     = null
}

variable "records" {
  description = "Zone records."
  type        = any
  default     = null
}
