output "id" {
  value = google_compute_network.vpc.id
}

output "gateway_ipv4" {
  value = google_compute_network.vpc.gateway_ipv4
}

output "subnet_ids" {
  value = "${google_compute_subnetwork.subnet.*.id}"
}

output "cloud_router_id"{
  value = google_compute_router.cloud_router.id
}

output "nat_id"{
  value = google_compute_router_nat.nat.id
}