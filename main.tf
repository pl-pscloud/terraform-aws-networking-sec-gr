resource "aws_security_group" "pscloud-sec-gr" {
  name        = "${var.pscloud-company}_sec_gr_${var.pscloud-name}"
  description = "Terraform Security Group for webserver"

  vpc_id = var.pscloud-vpc.id

  ingress {
    count       = 10
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.pscloud-company}_sec_gr_${var.pscloud-name}_${var.pscloud-env}"
  }
}
