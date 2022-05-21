resource "aws_security_group" "sg_name" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id
  tags = var.security_group_tags

}


