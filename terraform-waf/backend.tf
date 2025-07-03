terraform {
  backend "s3" {
    bucket         = "waf2098"
    key            = "waf/ipset/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
