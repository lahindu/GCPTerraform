

resource "google_container_cluster" "primary" {
    name               = var.gke_cluster_name
    location           = var.region
    node_version       = var.kubernetes_version
    min_master_version = var.kubernetes_version
    project            = var.project_id
    network            = var.vpc_name

    node_locations = [
        "${var.region}-a",
        "${var.region}-b",
        "${var.region}-c",
    ]

    ip_allocation_policy {
        use_ip_aliases = true
    }

    remove_default_node_pool = true
    initial_node_count = 1

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


resource "google_container_node_pool" "primary" {
    name               = var.node_pool_name
    location           = var.region
    cluster            = google_container_cluster.primary.name
    project            = var.project_id
    initial_node_count = 1

    management {
        auto_repair  = true
        auto_upgrade = false
    }

    autoscaling {
        min_node_count = 1
        max_node_count = 2
    }

    node_config {
        preemptible  = false
        machine_type = var.machine_type

        metadata {
            disable-legacy-endpoints = "true"
        }

        oauth_scopes = [
            "https://www.googleapis.com/auth/bigquery",
            "https://www.googleapis.com/auth/cloud-platform",
            "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring.write",
            "https://www.googleapis.com/auth/monitoring",
            "https://www.googleapis.com/auth/pubsub",
            "https://www.googleapis.com/auth/service.management.readonly",
            "https://www.googleapis.com/auth/servicecontrol",
            "https://www.googleapis.com/auth/sqlservice.admin",
            "https://www.googleapis.com/auth/trace.append",
        ]
    }
}