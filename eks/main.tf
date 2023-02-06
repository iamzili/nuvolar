terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47"
    }

    kubernetes = {
        source  = "hashicorp/kubernetes"
        version = ">= 2.16.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }
  }

  backend "s3" {
      # S3 bucket and dynamodb table should exist, create them via ~/learn-terraform/s3-dynamodb-backend
      # Update the remote backend below to support your environment
      bucket         = "terraform-state-nuvolar"
      key            = "terraform.tfstate"
      region         = "eu-central-1"
      dynamodb_table = "TerraformStateNuvolar"
      encrypt        = true
  }
}

################################################################################
# Providers
################################################################################

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      CreatedBy = "terraform"
      Environment = "sandbox"
      Project = "nuvolar-technical test"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks_default.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_default.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks_default.cluster_name
    ]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_default.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_default.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        module.eks_default.cluster_name
      ]
    }
  }
}


################################################################################
# Locals
################################################################################

locals {
  azs      = data.aws_availability_zones.available.names
}

################################################################################
# Data
################################################################################

data "aws_availability_zones" "available" {
  state = "available"
}