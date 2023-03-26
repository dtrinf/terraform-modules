provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
}

resource "aws_security_group" "this" {
  name   = var.name
  vpc_id = var.vpc_id
  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = var.inbound_rules == null ? {} : { for index, rule in var.inbound_rules :
  uuidv5("oid", format("%s-%s", rule.from_port, rule.to_port)) => rule }

  security_group_id = aws_security_group.this.id
  cidr_ipv4         = each.value.cidr_ipv4 == "" ? null : each.value.cidr_ipv4
  cidr_ipv6         = each.value.cidr_ipv6 == "" ? null : each.value.cidr_ipv6
  description       = each.value.description == "" ? null : each.value.description
  from_port         = each.value.from_port == 0 ? null : each.value.from_port
  ip_protocol       = each.value.ip_protocol == "" ? null : each.value.ip_protocol
  prefix_list_id    = each.value.prefix_list_id == "" ? null : each.value.prefix_list_id
  to_port           = each.value.to_port == 0 ? null : each.value.to_port
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = var.outbound_rules == null ? {} : { for index, rule in var.outbound_rules :
  uuidv5("oid", format("%s-%s", rule.from_port, rule.to_port)) => rule }

  security_group_id = aws_security_group.this.id
  cidr_ipv4         = each.value.cidr_ipv4 == "" ? null : each.value.cidr_ipv4
  cidr_ipv6         = each.value.cidr_ipv6 == "" ? null : each.value.cidr_ipv6
  description       = each.value.description == "" ? null : each.value.description
  from_port         = each.value.from_port == 0 ? null : each.value.from_port
  ip_protocol       = each.value.ip_protocol == "" ? null : each.value.ip_protocol
  prefix_list_id    = each.value.prefix_list_id == "" ? null : each.value.prefix_list_id
  to_port           = each.value.to_port == 0 ? null : each.value.to_port
}
