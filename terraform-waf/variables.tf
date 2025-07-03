variable "region" {
  default = "ap-southeast-1"
}

variable "web_acl_name" {}
variable "scope" {
  default = "REGIONAL"
}

variable "ip_set_allow" {
  type = list(string)
}

variable "ip_set_block" {
  type = list(string)
}

variable "resource_arns" {
  type = list(string)
}