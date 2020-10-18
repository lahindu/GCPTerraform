resource "google_sql_database_instance" "master" {
  name             = "terraform-master"
  region           = "us-east1"
  database_version = "MYSQL_5_7"
  project          = "et-dte-platform-core"
  root_password    = "Root@1234"

    settings {
        tier                = "db-n1-standard-1"
        availability_type   = "ZONAL"
        disk_autoresize     = true
        disk_size           = 20
        disk_type           = "PD_SSD"
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