data "azurerm_mssql_server" "server_data" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
}


