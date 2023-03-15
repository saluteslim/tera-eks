
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = var.namespace
  create_namespace = true
}

resource "helm_release" "grafana" {
  name      = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.namespace
  create_namespace = true

  set {
    name  = "adminPassword"
    value = var.namespace
}
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.23.3"
  namespace  = var.namespace
  create_namespace = true
}
