resource "google_container_registry" "registry" {
    project  = var.project_id
    location = var.cr_location
}

resource "google_storage_bucket_iam_member" "viewer" {
    bucket = google_container_registry.registry.id
    role = "roles/storage.objectViewer"
    member = "user:${var.cr_member}"
}

data "google_container_registry_repository" "gcrr" {
}