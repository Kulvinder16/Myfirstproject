data "azurerm_key_vault" "data_key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "db_secret_username" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}
data "azurerm_key_vault_secret" "db_secret_password" {
  name         = var.secret_password
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}
