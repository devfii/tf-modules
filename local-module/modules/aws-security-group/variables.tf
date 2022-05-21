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

variable "security_group_tags" {
  description = "Tags to be applied to resources created by configuration "
  type        = map(string)
  default = {
    Environment = "dev"
    terraform   = "True"
  }
}
