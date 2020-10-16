variable "region" {
    description = ""
    default     = "us-east1"
}

variable "vpc_name" {
    description = ""
    default     = "vpc-eks-dev-1"
}

variable "subnet_name" {
  description   = ""
  default       = [ "vpc-gke-1-web", "vpc-gke-1-dtesvc", "vpc-gke-1-db", "vpc-gke-1-toolstack" ]
}                 

