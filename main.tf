# Provider
provider "google" {
  project = "et-dte-platform-core"
  region  = "us-east1"
}

module "vpc" {
    source                      = "./modules/vpc"
    vpc_name                    = "vpc-eks-dev-1"
    vpc_description             = "EKS Development Environment"
    subnet_cidr_blocks          = [ "10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24" ]
    subnet_name                 = [ "vpc-gke-1-web", "vpc-gke-1-dtesvc", "vpc-gke-1-db", "vpc-gke-1-toolstack" ]
    region                      = [ "us-east1", "us-east1", "us-east2", "us-east2" ]
    cloud_router                = "vpc-gke-1-cldrt"
    cloud_router_region         = "us-east1"
    nat_name                    = "vpc-gke-1-cldnat"
}
