Project Summary: Terraform-based AWS WAF Deployment
---------------------------------------------------
What This Project Does
-----------------------
This repository sets up an AWS WAF (Web Application Firewall) using Terraform. It uses a remote S3 backend for state management and supports deployment and teardown via GitHub Actions.

What I’ve Done So Far
----------------------
Created a Remote Terraform Backend

Used a separate backend-setup/ folder to provision a versioned and encrypted S3 bucket in ap-southeast-1.

The bucket is used for storing Terraform state remotely.
---------------------------------------------------------------------------------
Configured the backend using backend.tf in the main project.

Configured GitHub Actions Workflow

Created .github/workflows/deploy-waf.yml to automate deployment using Terraform.

The workflow runs terraform init, plan, and apply against the terraform-waf/ directory.
------------------------------------------------------------------------------------------
1) Developed a WAF Terraform Module

2) Modularized the WAF and IP set logic in terraform-waf/modules/waf/.

3) Used an Existing Load Balancer

4) Reused an existing ALB to associate with the WAF using Terraform.

5) Deployed the WAF

6) Successfully deployed the WAF setup through GitHub Actions using manual or push-based triggers.

Destroyed the Infrastructure
-----------------------------

Resources can be destroyed either manually or via GitHub Actions.

Destroying Resources
Destroy via GitHub Actions (Safe for CI/CD):
-
name: Destroy WAF via Terraform

on:
  workflow_dispatch:

env:
  TF_VERSION: "1.6.6"
  AWS_REGION: "ap-southeast-1"
  TF_WORKING_DIR: "./terraform-waf"

jobs:
  destroy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: ${{ env.TF_VERSION }}

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Terraform Init
        working-directory: ${{ env.TF_WORKING_DIR }}
        run: terraform init

      - name: Terraform Destroy
        working-directory: ${{ env.TF_WORKING_DIR }}
        run: terraform destroy -auto-approve -var-file="terraform.tfvars"
