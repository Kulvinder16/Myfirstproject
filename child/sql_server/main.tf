resource "azurerm_mssql_server" "example" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.server_location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.db_secret_username.value
  administrator_login_password = data.azurerm_key_vault_secret.db_secret_password.value
  minimum_tls_version          = "1.2"

  }
