variable "web_acl_name" {
  description = "Name of the Web ACL"
  type        = string
}

variable "scope" {
  description = "Scope of WAF: REGIONAL or CLOUDFRONT"
  type        = string
  default     = "REGIONAL"
}

variable "ip_set_allow" {
  description = "Allowed IP addresses"
  type        = list(string)
}

variable "ip_set_block" {
  description = "Blocked IP addresses"
  type        = list(string)
}

variable "resource_arns" {
  description = "List of ARNs to associate the WAF with"
  type        = list(string)
}
