variable "project_id" {
    description = ""
    default     = "project_id"
}

variable "gke_cluster_name" {
    description = ""
    default     = ""
}

variable "region" {
    description = ""
    default     = ""
}

variable "vpc_name" {
    description = ""
    default     = ""
}

variable "subnetwork" {
    description = ""
    default     = ""
}

variable "ip_range_pods" {
    description = "ip_range_pods"
    default     = ""
}

variable "ip_range_services" {
    description = "ip_range_services"
    default     = ""
}

variable "kubernetes_version" {
    description = "kubernetes_version"
    default     = ""
}

variable "regional" {
    description = "regional"
    default     = ""
}

variable "zones" {
    description = "zones"
    default     = ""
}

variable "node_pool1_name" {
    description = "node_pool_name"
    default     = ""
}

variable "node_pool2_name" {
    description = "node_pool_name"
    default     = ""
}

variable "machine_type" {
    description = "machine_type"
    default     = ""
}

variable "initial_node_count" {
    description = "initial_node_count"
    default     = ""
}

variable "min_count" {
    description = "min_count"
    default     = ""
}

variable "max_count" {
    description = "max_count"
    default     = ""
}

variable "local_ssd_count" {
    description = "local_ssd_count"
    default     = ""
}

variable "disk_size_gb" {
    description = "disk_size_gb"
    default     = ""
}

variable "disk_type" {
    description = "disk_type"
    default     = ""
}

variable "image_type" {
    description = "image_type"
    default     = ""
}

variable "preemptible" {
    description = "preemptible"
    default     = ""
}
