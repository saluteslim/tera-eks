provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.tes-eks-cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.tes-eks-cluster.certificate_authority[0].data)
    config_context_cluster = aws_eks_cluster.tes-eks-cluster.name
  }
}

provider "kubernetes" {
    host                   = aws_eks_cluster.tes-eks-cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.tes-eks-cluster.certificate_authority[0].data)
    config_context_cluster = aws_eks_cluster.tes-eks-cluster.name
  
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = var.prometheus_namespace
}

resource "helm_release" "grafana" {
  name      = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.grafana_namespace
  set {
    name  = "adminPassword"
    value = var.grafana_password
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = var.argocd_namespace
}
