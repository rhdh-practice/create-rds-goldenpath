variable "db_username" {
  description = "The username for RDS database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for RDS database"
  type        = string
  sensitive   = true
}
