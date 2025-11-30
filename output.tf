output "eks_cluster_name" {
  description = "EKS cluster name from the eks-deployment module"
  value       = module.eks-deployment.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks-deployment.cluster_endpoint
}