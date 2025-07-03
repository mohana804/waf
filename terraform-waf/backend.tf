terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "waf/ipset/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "lock-table"
    encrypt        = true
  }
}