# Provider
provider "google" {
  project = "et-dte-platform-core"
  region  = "us-east1"
}

module "vpc" {
    source                      = "./modules/vpc"
    vpc_name                    = "dte-eks-dev-1"
    vpc_description             = "EKS Development Environment"
}

