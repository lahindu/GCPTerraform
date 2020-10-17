


resource "google_container_cluster" "primary" {
  name               = "marcellus-wallace"
  location           = "us-east1"
  initial_node_count = 3

  node_locations = [
    "us-east1",
  ]

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    guest_accelerator {
      type  = "nvidia-tesla-k80"
      count = 1
    }
  }
}

resource "google_container_node_pool" "np" {
  name       = "my-node-pool"
  location   = "us-east1"
  cluster    = google_container_cluster.primary.name
  node_count = 3

  timeouts {
    create = "30m"
    update = "20m"
  }
}