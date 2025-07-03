region         = "us-east-1"
web_acl_name   = "example-waf"
scope          = "REGIONAL"

ip_set_allow = [
  "203.0.113.5/32",
  "192.0.2.10/32"
]

ip_set_block = [
  "198.51.100.0/24",
  "203.0.113.100/32"
]

resource_arns = [
  "arn:aws:elasticloadbalancing:ap-southeast-1:277707132353:loadbalancer/app/cognos-app/3b5c4827a9174d0c"
]