terraform {
  backend "s3" {
    bucket         = "your-unique-terraform-state-bucket"
    key            = "waf/ipset/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
