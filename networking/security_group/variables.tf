variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "create" {
  description = "Controls if key security group should be created"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the security group."
  type        = string
  default     = ""
}

variable "inbound_rules" {
  description = "A list of maps of inbound rules to add to the security group."
  type = list(object({
    cidr_ipv4      = string
    cidr_ipv6      = string
    description    = string
    from_port      = number
    ip_protocol    = string
    prefix_list_id = string
    to_port        = number
  }))
  default = []
}

variable "outbound_rules" {
  description = "A list of maps of outbound rules to add to the security group."
  type = list(object({
    cidr_ipv4      = string
    cidr_ipv6      = string
    description    = string
    from_port      = number
    ip_protocol    = string
    prefix_list_id = string
    to_port        = number
  }))
  default = [{
    cidr_ipv4      = "0.0.0.0/0"
    cidr_ipv6      = ""
    description    = "Allow all outbound traffic"
    from_port      = 0
    ip_protocol    = "all"
    prefix_list_id = ""
    to_port        = 0
  }]
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  default     = ""
}
