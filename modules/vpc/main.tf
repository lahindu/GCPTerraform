# Define VPC
resource "google_compute_network" "vpc" {
    name                            = var.vpc_name
    description                     = var.vpc_description
    delete_default_routes_on_create = true
    auto_create_subnetworks         = false
    routing_mode                    = var.vpc_routing_mode
}

resource "google_compute_subnetwork" "subnet" {
    count                   = length(var.subnet_name)
    name                    = var.subnet_name[count.index]
    ip_cidr_range           = var.subnet_cidr_blocks[count.index]
    region                  = var.region
    network                 = google_compute_network.vpc.id
}

resource "google_compute_router" "cloud_router" {
    name                = var.cloud_router
    region              = var.cloud_router_region
    network             = google_compute_network.vpc.name
    dest_range          = "0.0.0.0/0"
    priority            = 100
    next_hop_gateway    = "default-internet-gateway"

}

#resource "google_compute_router_nat" "nat" {
#    name                               = var.nat_name
#    router                             = google_compute_router.cloud_router.name
#    region                             = google_compute_router.cloud_router.region
#    nat_ip_allocate_option             = "AUTO_ONLY"
#    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#}