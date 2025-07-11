data "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
virtual_network_name = var.virtual_network_name
}

data "azurerm_key_vault" "data_key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "secret_username" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}
data "azurerm_key_vault_secret" "secret_password" {
  name         = var.secret_password
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}
