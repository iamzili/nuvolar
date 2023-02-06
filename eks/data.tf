data "kubernetes_service" "ingress-nginx-controller" {

  metadata {
    name      = "ingress-nginx-controller"
    namespace = "default"
  }
  depends_on = [
    helm_release.nginx_ingress
  ]
}