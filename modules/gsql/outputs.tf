output "self_link" {
  value = google_sql_database_instance.mysql.self_link
}

output "connection_name" {
  value = google_sql_database_instance.mysql.connection_name
}

output "ip_address" {
  value = google_sql_database_instance.mysql.ip_address.0.ip_address
}