# Provider
provider "google" {
  project = "et-dte-platform-core"
  #region  = "us-east1"
}

module "vpc" {
    source                      = "./modules/vpc"
    vpc_name                    = var.vpc_name
    vpc_description             = "EKS Development Environment"
    subnet_cidr_blocks          = "10.5.0.0/20"
    subnet_name                 = var.subnet_name
    region                      = var.region
    cloud_router                = "vpc-gke-1-cldrt"
    cloud_router_region         = var.region
    cloud_route                 = "${var.vpc_name}-cloud-route"
    ip_range_pods_cidr          = "10.0.0.0/14"
    ip_range_services_cidr      = "10.4.0.0/19"
    vpc_routing_mode            = "REGIONAL"
    #nat_name                    = "vpc-gke-1-cldnat"
}

module "gke" {
    source                      = "./modules/gke"
    project_id                  = "et-dte-platform-core"
    gke_cluster_name            = "dte-eks"
    region                      = var.region
    vpc_name                    = var.vpc_name
    subnetwork                  = "vpc-gke-1-web"
    ip_range_pods               = "${var.vpc_name}-${var.region}-pods"
    ip_range_services           = "${var.vpc_name}-${var.region}-services"
    kubernetes_version          = "1.17.9-gke.1504"
    regional                    = true
    node_pool_name              = "dte-eks-node-pool"
    machine_type                = "n1-standard-1"
    initial_node_count          = 1
    min_count                   = 1
    max_count                   = 2
    local_ssd_count             = 0
    disk_size_gb                = 50
    disk_type                   = "pd-standard"
    image_type                  = "COS"
    preemptible                 = true
}

module "gcr" {
    source                      = "./modules/gcr"
    project_id                  = "et-dte-platform-core"
    cr_location                 = "us"
    cr_member                   = "lahindu.weerarathna@axiatadigitallabs.com"
}