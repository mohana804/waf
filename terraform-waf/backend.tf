terraform {
  backend "s3" {
    bucket         = "waf1234-unique-terraform-state-bucket"
    key            = "waf/ipset/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
