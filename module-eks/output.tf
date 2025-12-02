output "nginx_ingress_load_balancer_hostname" {
  description = "Hostname of the NGINX Ingress Load Balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_lb_ip" {
  description = "Fallback LB hostname (AWS LB has no IP)"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_ingress_lb_dns" {
  description = "DNS name of the NGINX ingress load balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}
