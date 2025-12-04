resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  namespace        = "ingress-nginx"
  create_namespace = false
  
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.12.0"

  # This tells Helm: "If it exists, don't fail - just manage it"
  replace = true
  
  lifecycle {
    ignore_changes = all
  }
}