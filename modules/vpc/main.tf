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
    region                  = var.region[count.index]
    network                 = google_compute_network.vpc.id
}