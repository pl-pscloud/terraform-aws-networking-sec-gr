variable "pscloud_env" {}
variable "pscloud_company" {}
variable "pscloud_vpc" {}
variable "pscloud_sec_name" {}
variable "pscloud_sec_ports" {}

variable "pscloud_from_cidr" {
  type = list(object({
    port          = string
    cidr          = string
    protocol      = string
  }))
  default = []
}

variable "pscloud_from_sec_gr" {
  type = list(object({
    port          = string
    cidr          = string
    protocol      = string
  }))
  default = []
}