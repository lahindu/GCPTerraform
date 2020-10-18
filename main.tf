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

module "gsql" {
    source                      = "./modules/gsql"
    vpc_id                      = module.vpc.id
    sqldb_name                  = "dte-sql"
    region                      = var.region
    database_version            = "MYSQL_5_7"
    project_id                  = "et-dte-platform-core"
    root_password               = "Root@1234"
    sql_tier                    = "db-n1-standard-1"
    sql_availability_type       = "ZONAL"
    sql_disk_size               = 50
    sql_disk_type               = "PD_SSD"
}