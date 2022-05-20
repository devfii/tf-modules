terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.15.0"
    }
  }

  required_version = "~> 1.1.9"

}

provider "aws" {
  profile = "admin"
  region = "eu-west-1"

}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "3.14.0"
  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.vpc_azs
  private_subnets    = var.vpc_private_subnets
  public_subnets     = var.vpc_public_subnets
  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags

}

module "security-group" {
  source      = "./modules/aws-security-group"
  security_group_name        = "my-sg"
  security_group_description = "security group created from module"
  vpc_id      = module.vpc.vpc_id
  
}

module "security-group-rule" {
  source      = "./modules/aws-security-group-rule"
  protocol = "tcp"
  rule_type = "ingress"
  from_port = 8080
  to_port = 8080
  cidr_blocks = "0.0.0.0/0"
  security_group_id = module.security-group.id
  
}

module "security-group-rule" {
  source      = "./modules/aws-security-group-rule"
  protocol = "tcp"
  rule_type = "ingress"
  from_port = 22
  to_port = 22
  cidr_blocks = "0.0.0.0/0"
  security_group_id = module.security-group.id
  
}



module "ec2-instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "4.0.0"
  name                   = var.ec2-instance_name
  ami                    = var.ec2-instance_ami
  vpc_security_group_ids = [module.security-group.id]
  instance_type          = var.ec2-instance_type
  count                  = 1
  subnet_id              = module.vpc.public_subnets[0]

}
