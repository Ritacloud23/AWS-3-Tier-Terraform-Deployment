#########################################
# NGINX Ingress Outputs
#########################################

output "nginx_ingress_load_balancer_hostname" {
  description = "DNS hostname of the NGINX ingress load balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_ingress_lb_dns" {
  description = "DNS name of NGINX ingress LB"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_lb_ip" {
  description = "IP address (if any) of NGINX ingress LB"
  value       = (
    data.aws_lb.nginx_ingress.ip_address_type == "ipv4"
      ? data.aws_lb.nginx_ingress.dns_name
      : ""
  )
}
