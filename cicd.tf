provider "helm" {
  kubernetes {
    config_path            = var.kubeconfig_path
    config_context_cluster = var.cluster_name
  }
}

resource "helm_release" "prometheus" {
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = var.prometheus_namespace
}

resource "helm_release" "grafana" {
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.grafana_namespace
  set {
    name  = "adminPassword"
    value = var.grafana_password
  }
}

resource "helm_release" "argocd" {
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = var.argocd_namespace
}
