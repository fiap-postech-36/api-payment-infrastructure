variable "regionDefault" {
  default = "us-east-1"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "restaurant"
}

variable "db_username" {
  description = "The database admin username"
  type        = string
  default     = "postgresql"
}

variable "key_name" {
  type      = string
  sensitive = true
  default   = "vockey"
}

variable "projectName" {
  type    = string
  default = "payment-infra"
}

variable "accountIdVoclabs" {
  default = "716572403861"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "principalArn" {
  default = "arn:aws:iam::716572403861:role/voclabs"
}

variable "labRole" {
  default = "arn:aws:iam::716572403861:role/LabRole"
}

variable "instanceType" {
  default = "t3a.medium"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "nodeGroup" {
  default = "group-36"
}