variable "regionDefault" {
  default = "us-east-1"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "payment"
}

variable "db_username" {
  description = "The database admin username"
  type        = string
  default     = "mongodb"
}

variable "key_name" {
  type        = string
  sensitive   = true
  default     = "mongo_db"
}

variable "subnet_ids" {
  description = "IDs das sub-redes que serão usadas pelo DB Subnet Group."
  type        = list(string)
  default     = ["subnet-036e9c0285e80d437", "subnet-0dfe4f03208fc9a22"]
}

variable "vpcId" {
  default = "vpc-03a5cddaa5925e270"
}
