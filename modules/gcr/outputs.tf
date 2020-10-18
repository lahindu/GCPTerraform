output "id" {
  value = google_container_registry.registry.id
}

output "bucket_self_link" {
  value = google_container_registry.suregistrybnet.bucket_self_link
}