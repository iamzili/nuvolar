output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks_default.cluster_endpoint
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks_default.cluster_name
}

output "elb_dns_name" {
  description = "External DN name of elastic load balancer"
  value       = data.kubernetes_service.ingress-nginx-controller.status.0.load_balancer.0.ingress.0.hostname

  depends_on = [
    helm_release.nginx_ingress
  ]
}