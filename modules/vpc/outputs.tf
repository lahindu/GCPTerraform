output "id" {
  value = google_compute_network.vpc.id
}

output "gateway_ipv4" {
  value = google_compute_network.vpc.gateway_ipv4
}