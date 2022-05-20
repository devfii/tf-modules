variable "region" {
  default     = "eu-west-1"
  description = "Default region where resources are to be created"
}

variable "vpc_name" {
  description = "Your VPC's name"
  type        = string
  default     = "my-vpc"

}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "172.32.0.0/16"
}

variable "vpc_azs" {
  description = "AZs for VPC"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

}

variable "vpc_private_subnets" {
  description = "Private subnets in VPC"
  type        = list(string)
  default     = ["172.32.0.0/24", "172.32.10.0/24", "172.32.100.0/24"]

}

variable "vpc_public_subnets" {
  description = "Public subnets in VPC"
  type        = list(string)
  default     = ["172.32.1.0/24", "172.32.11.0/24", "172.32.101.0/24"]

}

variable "vpc_enable_nat_gateway" {
  description = "Enable or disable creation of NAT Gateway"
  type        = bool
  default     = false

}

variable "vpc_tags" {
  description = "Tags to be applied to resources created by configuration "
  type        = map(string)
  default = {
    Environment = "dev"
    terraform   = "True"
  }
}

variable "ec2-instance_name" {
  description = "The name of the EC2 instances to create"
  type        = string
  default     = "my-ec2-instances"

}

variable "ec2-instance_type" {
  description = "The instance type to provision"
  type        = string
  default     = "t2.micro"

}

variable "ec2-instance_ami" {
  description = "value"
  type        = string
  default     = "ami-00e7df8df28dfa791"

}


