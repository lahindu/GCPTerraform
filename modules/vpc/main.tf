# Define VPC
resource "google_compute_network" "vpc" {
    name                            = var.vpc_name
    description                     = var.vpc_description
    delete_default_routes_on_create = false
    auto_create_subnetworks         = false
    routing_mode                    = var.vpc_routing_mode
}

resource "google_compute_subnetwork" "subnet" {
    #count                   = length(var.subnet_name)
    name                    = var.subnet_name
    ip_cidr_range           = var.subnet_cidr_blocks
    region                  = var.region
    network                 = google_compute_network.vpc.id
    secondary_ip_range {
        range_name    = "${var.vpc_name}-${var.region}-pods"
        ip_cidr_range = var.ip_range_pods_cidr
    }
    secondary_ip_range {
        range_name    = "${var.vpc_name}-${var.region}-services"
        ip_cidr_range = var.ip_range_services_cidr
    }
}



#resource "google_compute_router" "cloud_router" {
#    name                = var.cloud_router
#    region              = var.cloud_router_region
#    network             = google_compute_network.vpc.name
#    dest_range          = "0.0.0.0/0"
#    priority            = 100
    #next_hop_gateway    = "projects/project/global/gateways/default-internet-gateway"
#}

#resource "google_compute_router_nat" "nat" {
#    name                               = var.nat_name
#    router                             = google_compute_router.cloud_router.name
#    region                             = google_compute_router.cloud_router.region
#    nat_ip_allocate_option             = "AUTO_ONLY"
#    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#}