#############################################
# Variables for Route53 Module
#############################################

variable "environment" {
  type        = string
  description = "Environment tag (e.g. dev, production)"
}

variable "domain_name" {
  type        = string
  description = "Root domain name (e.g. pentaops.online)"
}

variable "nginx_lb_hostname" {
  type        = string
  description = "Nginx Ingress Load Balancer hostname from EKS module"
}
