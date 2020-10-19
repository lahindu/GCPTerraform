
resource "google_compute_global_address" "private_ip_address" {
    name          = "private-ip-address"
    purpose       = "VPC_PEERING"
    address_type  = "INTERNAL"
    prefix_length = 16
    network       = var.vpc_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
    network                 = var.vpc_id
    service                 = "servicenetworking.googleapis.com"
    reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_sql_database_instance" "mysql" {
    name             = var.sqldb_name
    region           = var.region
    database_version = var.database_version 
    project          = var.project_id 
    root_password    = var.root_password 

    depends_on = [google_service_networking_connection.private_vpc_connection]

    settings {
        tier                = var.sql_tier
        availability_type   = var.sql_availability_type
        disk_autoresize     = true
        disk_size           = var.sql_disk_size
        disk_type           = var.sql_disk_type
        #replication_type    = "SYNCHRONOUS"

        backup_configuration {
            enabled               = true
            start_time            = "17:00"
            binary_log_enabled    = true
        }

        maintenance_window{
            day                 = 7
            hour                = 22
            update_track        = "stable"
        }

        ip_configuration {
            ipv4_enabled    = false
            private_network = var.vpc_id
        }

        database_flags {
            name  = "slow_query_log"
            value = "on"
        }

        database_flags {
            name  = "character_set_server"
            value = "utf8mb4"
        }
    }
}