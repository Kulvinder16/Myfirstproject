variable "server_name" {
  description = "Name of the SQL Server"
  type        = string
  
}
variable "server_location" {
  description = "Location of the SQL Server"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group where the SQL Server will be created"
  type        = string
}
variable "key_vault_name" {
  description = "Name of the Key Vault where secrets are stored"
  type        = string
}
variable "secret_name" {
  description = "Name of the secret for the SQL Server administrator username"
  type        = string
}
variable "secret_password" {
  description = "Name of the secret for the SQL Server administrator password"
  type        = string
}
