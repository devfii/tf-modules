resource "aws_security_group" "sg_name" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

}

resource "aws_security_group_rule" "sg_rule" {
  type              = var.rule_type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = [var.cidr_blocks]
  security_group_id = aws_security_group.sg_name.id

}
