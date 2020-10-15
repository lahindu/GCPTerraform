# Define VPC
resource "google_compute_network" "vpc" {
    name                            = var.vpc_name
    description                     = var.vpc_description
    delete_default_routes_on_create = true
}