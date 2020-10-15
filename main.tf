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
    vpc_name                    = "dte-eks-dev-1"
    vpc_description             = "EKS Development Environment"
}

