resource "helm_release" "api-gateway" {
  name       = "api-gateway"
  chart      = "./charts/api-gateway"

  depends_on = [
    helm_release.nginx_ingress
  ]
}

resource "helm_release" "customer-service" {
  name       = "customer-service"
  chart      = "./charts/customer-service"
}

resource "helm_release" "order-service" {
  name       = "order-service"
  chart      = "./charts/order-service"
}

resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
}