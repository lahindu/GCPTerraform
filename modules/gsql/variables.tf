variable "project_id" {
    description = ""
    default     = "project_id"
}

variable "cr_location" {
    description = "Google container registry location"
    default     = "us"
}

variable "cr_member" {
    description = "Google container registry read permission user"
    default     = ""
}

variable "vpc_id" {
  description = "VPC ID"
  default     = ""
}