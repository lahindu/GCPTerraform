output "id" {
  value = google_container_registry.registry.id
}

output "bucket_self_link" {
  value = google_container_registry.registry.bucket_self_link
}

output "gcr_location" {
  value = data.google_container_registry_repository.gcrr.repository_url
}