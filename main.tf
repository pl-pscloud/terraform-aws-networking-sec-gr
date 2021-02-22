resource "aws_security_group" "pscloud-sec-gr" {
  name        = "${var.pscloud_company}_sec_gr_${var.pscloud_sec_name}"
  description = "Terraform Security Group for ${var.pscloud_sec_name}"

  vpc_id = var.pscloud_vpc.id

  tags = {
    Name = "${var.pscloud_company}_sec_gr_${var.pscloud_sec_name}_${var.pscloud_env}"
  }
}

resource "aws_security_group_rule" "pscloud-sec-rule-cidr" {
  for_each        = var.pscloud_from_cidr

  type            = each.value.type
  from_port       = each.value.from_port
  to_port         = each.value.to_port
  protocol        = each.value.protocol
  cidr_blocks     = each.value.val

  security_group_id = aws_security_group.pscloud-sec-gr.id
}

resource "aws_security_group_rule" "pscloud-sec-rule-sec-group" {
  for_each                     = var.pscloud_from_sec_gr

  type                         = each.value.type
  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  protocol                     = each.value.protocol
  source_security_group_id     = each.value.val

  security_group_id = aws_security_group.pscloud-sec-gr.id
}