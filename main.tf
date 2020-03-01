resource "aws_security_group" "pscloud-sec-gr" {
  name        = "${var.pscloud_company}_sec_gr_${var.pscloud_sec_name}"
  description = "Terraform Security Group for ${var.pscloud_sec_name}"

  vpc_id = var.pscloud_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.pscloud_company}_sec_gr_${var.pscloud_sec_name}_${var.pscloud_env}"
  }
}

resource "aws_security_group_rule" "pscloud-sec-rule-cidr" {
  count           = length(var.pscloud_from_cidr)

  type            = "ingress"
  from_port       = var.pscloud_from_cidr[count.index].port
  to_port         = var.pscloud_from_cidr[count.index].port
  protocol        = var.pscloud_from_cidr[count.index].protocol
  cidr_blocks     = var.pscloud_from_cidr[count.index].cidr

  security_group_id = aws_security_group.pscloud-sec-gr.id
}

resource "aws_security_group_rule" "pscloud-sec-rule-sec-group" {
  count           = length(var.pscloud_from_sec_gr)

  type            = "ingress"
  from_port       = var.pscloud_from_sec_gr[count.index].port
  to_port         = var.pscloud_from_sec_gr[count.index].port
  protocol        = var.pscloud_from_sec_gr[count.index].protocol
  cidr_blocks     = var.pscloud_from_sec_gr[count.index].cidr

  security_group_id = aws_security_group.pscloud-sec-gr.id
}