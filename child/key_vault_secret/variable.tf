variable "secret_name" {
  description = "The username for the database."
  type        = string
}

variable "secret_value" {
  description = "The username to be stored in Key Vault."
  type        = string
  
}

variable "key_vault_name" {
  description = "The name of the Key Vault where the secret will be stored."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault is located."
  type        = string
}