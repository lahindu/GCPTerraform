#output "id" {
#  value = module.gcr.id
#}

#output "bucket_self_link" {
#  value = module.gcr.bucket_self_link
#}

#output "gcr_location" {
#  value = module.gcr.gcr_location
#}

output "self_link" {
  value = module.gsql.self_link
}

output "connection_name" {
  value = module.gsql.connection_name
}

output "ip_address" {
  value = module.gsql.ip_address
}