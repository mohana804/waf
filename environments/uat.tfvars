web_acl_name = "uat-web-acl"
scope        = "REGIONAL"

ip_set_allow = [
  "203.0.113.1/32"
]

ip_set_block = [
  "192.0.2.0/24"
]

resource_arns = [
  "arn:aws:elasticloadbalancing:ap-southeast-1:277707132353:loadbalancer/app/cognos-app/3b5c4827a9174d0c"
]
