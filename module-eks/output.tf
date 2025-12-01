#############################################
# DATA SOURCE – Find Nginx Ingress LoadBalancer
#############################################

data "aws_lb" "nginx_ingress" {
  tags = {
    "app.kubernetes.io/name"      = "ingress-nginx"
    "app.kubernetes.io/component" = "controller"
  }
}

#############################################
# OUTPUTS – Ingress Load Balancer Details
#############################################

output "nginx_ingress_lb_dns" {
  description = "DNS name of the Nginx ingress load balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_lb_ip" {
  description = "LB IP/DNS depending on ingress type"
  value       = data.aws_lb.nginx_ingress.ip_address_type == "ipv4" ? data.aws_lb.nginx_ingress.dns_name : ""
}

output "nginx_ingress_load_balancer_hostname" {
  description = "Hostname of ingress load balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}
