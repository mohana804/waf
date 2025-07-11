web_acl_name = "prod-web-acl"
scope        = "REGIONAL"

ip_set_allow = [
  "203.0.113.1/32"
]

ip_set_block = [
  "192.0.2.0/24"
]

resource_arns = [
  "arn:aws:elasticloadbalancing:ap-southeast-1:YOUR_ACCOUNT_ID:loadbalancer/app/your-alb-name/1234567890abcdef"
]
