# Provider
provider "google" {
  project = "et-dte-platform-core"
  region  = "us-east1"
}


terraform {
    required_version = "~> 0.12.0"
}

module "vpc" {
    source                      = "./modules/vpc"
    environment                 = var.environment
    vpc_cidr                    = "10.1.0.0/16"
    eks_cluster_name            = "${var.project}-${var.environment}-${var.eks_cluster_name}"
    project                     = var.project
    public_subnet_cidr_blocks   = var.public_subnet_cidr_blocks
    private_subnet_cidr_blocks  = var.private_subnet_cidr_blocks
}

