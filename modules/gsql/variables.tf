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

variable "sqldb_name" { 
    description = "SQL Database name" 
    default     = "" 
}

variable "region" { 
    description = "Region name" 
    default     = "" 
}

variable "database_version" { 
    description = "Database version" 
    default     = "" 
}

variable "root_password" { 
    description = "Root password" 
    default     = "" 
}

variable "sql_availability_type" { 
    description = "SQL availability type" 
    default     = "" 
}

variable "sql_tier" { 
    description = "SQL tier" 
    default     = "" 
}

variable "sql_disk_size" { 
    description = "SQL disk size" 
    default     = "" 
}

variable "sql_disk_type" { 
    description = "SQL disk type" 
    default     = "" 
}