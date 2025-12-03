############################################
# EKS auth for Kubernetes / Helm providers
############################################

data "aws_eks_cluster" "eks" {
  name = aws_eks_cluster.eks.name
}

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.eks.name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

provider "helm" {
  kubernetes = {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}

############################################
# Adopt existing NGINX Ingress (avoid reinstall)
############################################
resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  namespace        = "ingress-nginx"
  create_namespace = true

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.12.0"

  values = [
    file("${path.module}/nginx-ingress-values.yaml")
  ]

  # Prevent Terraform destroying or reinstalling existing helm release
  lifecycle {
    ignore_changes = [
      version,
      values,
      set,
      repository,
      chart,
    ]
  }

  wait   = false
  atomic = false
}

############################################
# Discover NGINX Ingress Load Balancer
############################################
data "aws_lb" "nginx_ingress" {
  depends_on = [
    helm_release.nginx_ingress
  ]

  tags = {
    "kubernetes.io/service-name" = "ingress-nginx/ingress-nginx-controller"
  }
}
