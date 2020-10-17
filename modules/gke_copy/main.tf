
module "gke" {
    source                      = "terraform-google-modules/kubernetes-engine/google"

    # required variables
    project_id                  = var.project_id
    name                        = var.gke_cluster_name
    region                      = var.region
    network                     = var.vpc_name 
    subnetwork                  = var.subnetwork
    ip_range_pods               = var.ip_range_pods
    ip_range_services           = var.ip_range_services

    # optional variables
    kubernetes_version          = var.kubernetes_version
    regional                    = var.regional
    create_service_account      = false  
    remove_default_node_pool    = true

    # addons
    http_load_balancing         = false
    horizontal_pod_autoscaling  = true
    network_policy              = true

    node_pools = [
    {
        name                    = var.node_pool_name
        machine_type            = var.machine_type
        initial_node_count      = var.initial_node_count
        min_count               = var.min_count
        max_count               = var.max_count
        local_ssd_count         = var.local_ssd_count
        disk_size_gb            = var.disk_size_gb
        disk_type               = var.disk_type
        image_type              = var.image_type
        auto_repair             = true
        auto_upgrade            = true
        preemptible             = var.preemptible
    },
    ]

    node_pools_oauth_scopes = {
        all = []

        default-node-pool = [
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
            "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
            "https://www.googleapis.com/auth/service.management.readonly",
            "https://www.googleapis.com/auth/servicecontrol",
            "https://www.googleapis.com/auth/trace.append",
        ]
    }

    node_pools_labels = {
        all = {}

        default-node-pool = {
            default-node-pool = true
        }
    }

    node_pools_metadata = {
        all = {}

        default-node-pool = {
            node-pool-metadata-custom-value = var.gke_cluster_name
        }
    }

    node_pools_tags = {
        all = []

            default-node-pool = [
            "default-node-pool",
        ]
    }
}