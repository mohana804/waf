variable "web_acl_name" {}
variable "scope" {}
variable "ip_set_allow" {
  type = list(string)
}
variable "ip_set_block" {
  type = list(string)
}
variable "resource_arns" {
  type = list(string)
}