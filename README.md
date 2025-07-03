# AWS WAF Terraform Deployment

This repo provisions an AWS WAF Web ACL using Terraform, with IP allow/block rules and GitHub Actions automation.

## Structure

- `terraform-waf/`: Root module
- `modules/waf/`: Reusable WAF module
- `.github/workflows/`: CI/CD pipeline

## Deployment

Ensure:
- Your backend S3/DynamoDB is set up
- You have a GitHub OIDC IAM role (`GitHubActionsRole`)

### Steps

```sh
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve
```

## CI/CD

Trigger on:
- Push to `main`
- Manual GitHub Actions dispatch