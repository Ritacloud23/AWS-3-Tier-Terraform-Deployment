#########################################################
# Route53 Hosted Zone
#########################################################

resource "aws_route53_zone" "r53_zone" {
  name          = var.domain_name
  comment       = "Managed by Terraform"
  force_destroy = true

  tags = {
    Name        = "${var.environment}-hosted-zone"
    Environment = var.environment
  }
}

#########################################################
# DNS CNAME RECORDS
#########################################################

resource "aws_route53_record" "bank" {
  zone_id = aws_route53_zone.r53_zone.zone_id
  name    = "bank.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.nginx_lb_hostname]
}

resource "aws_route53_record" "bankapi" {
  zone_id = aws_route53_zone.r53_zone.zone_id
  name    = "bankapi.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.nginx_lb_hostname]
}

resource "aws_route53_record" "argocd" {
  zone_id = aws_route53_zone.r53_zone.zone_id
  name    = "argocd.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.nginx_lb_hostname]
}
