resource "aws_wafv2_ip_set" "allow" {
  name               = "${var.web_acl_name}-allow"
  description        = "Allowlist IPs"
  scope              = var.scope
  ip_address_version = "IPV4"
  addresses          = var.ip_set_allow
}

resource "aws_wafv2_ip_set" "block" {
  name               = "${var.web_acl_name}-block"
  description        = "Blocklist IPs"
  scope              = var.scope
  ip_address_version = "IPV4"
  addresses          = var.ip_set_block
}

resource "aws_wafv2_web_acl" "this" {
  name        = var.web_acl_name
  scope       = var.scope
  description = "WAF ACL with IP sets"
  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.web_acl_name}-metrics"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "AllowIPs"
    priority = 1
    action {
      allow {}
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.allow.arn
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AllowIPs"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "BlockIPs"
    priority = 2
    action {
      block {}
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.block.arn
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "BlockIPs"
      sampled_requests_enabled   = true
    }
  }
}

resource "aws_wafv2_web_acl_association" "assoc" {
  count        = length(var.resource_arns)
  resource_arn = var.resource_arns[count.index]
  web_acl_arn  = aws_wafv2_web_acl.this.arn
}