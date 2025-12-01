#############################################
# Clean Outputs for EKS Module
#############################################

output "eks_cluster_name" {
  description = "EKS cluster name from the eks-deployment module"
  value       = module.eks-deployment.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint from the eks-deployment module"
  value       = module.eks-deployment.cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  description = "EKS Cluster CA data"
  value       = module.eks-deployment.cluster_certificate_authority_data
}
