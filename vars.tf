variable "pscloud_env" {}
variable "pscloud_company" {}
variable "pscloud_vpc" {}
variable "pscloud_sec_name" {}

variable "pscloud_from_cidr" {
  type = list(object({
    from_port     = string
    to_port       = string
    protocol      = string
    val           = set(string)
  }))
  default = []
}

variable "pscloud_from_sec_gr" {
  type = list(object({
    from_port     = string
    to_port       = string
    protocol      = string
    val           = string
  }))
  default = []
}