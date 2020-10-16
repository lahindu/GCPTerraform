variable "vpc_name" {
  description = "VPC name"
  default     = "dte-gke-1"
}

variable "vpc_description" {
  description       = "Description for VPC"
  default           = "vpc-description"
}

variable "vpc_routing_mode" {
  description       = "VPC Routing mode "
  default           = "REGIONAL"
}

variable "subnet_cidr_blocks" {
  description       = "VPC Routing mode "
  default           = [ "10.1.1.0/24", "10.1.2.0/24" ]
}

variable "subnet_name" {
  description       = "Subnet name"
  default           =  [ "vpc-gke-1-web", "vpc-gke-1-dtesvc" ]
}

variable "region" {
  description       = "Region name"
  default           =  [ "us-east1", "us-east1" ]
}




