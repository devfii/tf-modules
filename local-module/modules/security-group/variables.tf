variable "security_group_name" {
  type        = string
  description = "Name of the security group"
}

variable "security_group_description" {
  type        = string
  description = "Description for security group to be created"
}

variable "vpc_id" {
  type        = string
  description = "VPC in which security group should be created"
}


variable "rule_type" {
  type        = string
  description = "The type of security group rule to be created"
  validation {
    condition     = contains(["ingress", "egress", ], var.rule_type)
    error_message = "Valid values for protocol are ingress and egress."
  }

}

variable "from_port" {
  type        = number
  description = "from port"

}

variable "to_port" {
  type        = number
  description = "to port"
}

variable "protocol" {

  validation {
    condition     = contains(["tcp", "udp", ], var.protocol)
    error_message = "Valid values for protocol are tcp and udp."
  }
}


variable "cidr_blocks" {
  nullable    = true
  type        = string
  description = "IPv4 CIDR block"

}

#variable "ipv6_cidr_blocks" {
#  nullable    = true
#  type        = string
#  description = "IPv6 CIDR block"
#}
