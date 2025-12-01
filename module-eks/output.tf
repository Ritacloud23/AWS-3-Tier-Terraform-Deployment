#################################
# EKS Outputs
#################################

# output "cluster_name" {
#   description = "EKS cluster name"
#   value       = aws_eks_cluster.eks.name
# }

# output "cluster_endpoint" {
#   description = "EKS cluster API endpoint"
#   value       = aws_eks_cluster.eks.endpoint
# }

#################################
# NGINX Ingress / LB Outputs
#################################

output "nginx_ingress_lb_dns" {
  description = "DNS name of the NGINX ingress load balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_lb_ip" {
  description = "IP (DNS name if IPv4) of the NGINX load balancer"
  value       = data.aws_lb.nginx_ingress.ip_address_type == "ipv4" ? data.aws_lb.nginx_ingress.dns_name : ""
}

output "nginx_ingress_load_balancer_hostname" {
  description = "Hostname of the NGINX ingress load balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}
