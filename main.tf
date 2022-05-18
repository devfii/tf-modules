terraform {
    required_providers {
        aws = {
            source = "aws/hashicorp"
            version = "~> 4.14.0"
        }
    }

    required_version = "~> 1.1.9"
}

provider "aws" {
    profile = "default"
    region = "eu-west-1"
    default_tags = {
        tags = {
            purpose = "learn"
        }
    }
  
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "3.14.0"
    name = var.vpc_name
    cidr = var.vpc_cidr
    azs = var.vpc_azs
    private_subnets = var.vpc_private_subnets
    public_subnets = var.vpc_public_subnets
    enable_nat_gateway = var.vpc_enable_nat_gateway

    tags = var.vpc_tags
  
}

module "ec2-instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "4.0.0"
    name = var.ec2-instance_name
    ami = var.ec2-instance_ami
    vpc_security_group = [module.vpc.default_security_group_id]
    instance_type = var.ec2-instance_type
    count = 1
    subnet_id = module.vpc.public_subnets[0]
  
}

