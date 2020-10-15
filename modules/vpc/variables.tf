variable "vpc_name" {
  description = "VPC name"
  default     = "dte-dev-1"
}

variable "vpc_description" {
  description       = "Description for VPC"
  default           = "vpc-description"
}

variable "vpc_routing_mode" {
  description       = "VPC Routing mode "
  default           = "REGIONAL"
}