resource "azurerm_mssql_database" "sql_database" {
  name         = var.db_name
  server_id    = data.azurerm_mssql_server.server_data.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
}

