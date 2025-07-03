provider "aws" {
  region = var.region
}

module "waf" {
  source         = "./modules/waf"
  web_acl_name   = var.web_acl_name
  scope          = var.scope
  ip_set_allow   = var.ip_set_allow
  ip_set_block   = var.ip_set_block
  resource_arns  = var.resource_arns
}