# Provider
provider "google" {
  project = "et-dte-platform-core"
  #region  = "us-east1"
}

module "vpc" {
    source                      = "./modules/vpc"
    vpc_name                    = var.vpc_name
    vpc_description             = "EKS Development Environment"
    subnet_cidr_blocks          = [ "10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24" ]
    subnet_name                 = [ "vpc-gke-1-web", "vpc-gke-1-dtesvc", "vpc-gke-1-db", "vpc-gke-1-toolstack" ]
    region                      = var.region
    cloud_router                = "vpc-gke-1-cldrt"
    cloud_router_region         = var.region
    cloud_route                 = "${var.vpc_name}-cloud-route"
    #nat_name                    = "vpc-gke-1-cldnat"
}

module "gke" {
    source                      = "./modules/gke"
    project_id                  = "et-dte-platform-core"
    gke_cluster_name            = "dte-eks"
    region                      = var.region
    vpc_name                    = var.vpc_name
    subnetwork                  = "${var.vpc_name}-${var.region}-subnetwork"
    ip_range_pods               = "${var.vpc_name}-${var.region}-pods"
    ip_range_services           = "${var.vpc_name}-${var.region}-services"
    kubernetes_version          = "1.17.9-gke.1504"
    regional                    = true
    node_pool_name              = "dte-eks-node-pool"
    machine_type                = "n1-standard-1"
    initial_node_count          = 2
    min_count                   = 2
    max_count                   = 4
    local_ssd_count             = 0
    disk_size_gb                = 50
    disk_type                   = "pd-standard"
    image_type                  = "COS"
    preemptible                 = true

}