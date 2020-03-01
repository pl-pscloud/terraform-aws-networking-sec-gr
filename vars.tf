variable "pscloud_env" {}
variable "pscloud_company" {}
variable "pscloud_vpc" {}
variable "pscloud_sec_name" {}

variable "pscloud_from_cidr" {
  type = list(object({
    port          = string
    cidr          = list(string)
    protocol      = string
  }))
  default = []
}

variable "pscloud_from_sec_gr" {
  type = list(object({
    port          = string
    sec_gr        = list(string)
    protocol      = string
  }))
  default = []
}