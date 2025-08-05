module "rgtodo1" {
  source                  = "../child/rg"
  resource_group_name     = "rgtest1"
  resource_group_location = "Central India"
}

module "rgtodo1" {
  source                  = "../child/rg"
  resource_group_name     = "rgtest3"
  resource_group_location = "Canada Central"
}

module "vnet1" {
  depends_on              = [module.rgtodo1]
  source                  = "../child/v_net"
  vnet_name               = "vnet1"
  resource_group_name     = "rgtest1"
  resource_group_location = "Central India"
  address_space           = ["10.0.0.0/16"]
}

module "subnet1" {
  depends_on           = [module.vnet1]
  source               = "../child/sub_net"
  subnet_name          = "frontendsubnet1"
  resource_group_name  = "rgtest1"
  virtual_network_name = "vnet1"
  address_prefixes     = ["10.0.1.0/24"]
}
module "subnet2" {
  depends_on           = [module.vnet1]
  source               = "../child/sub_net"
  subnet_name          = "Backendsubnet1"
  resource_group_name  = "rgtest1"
  virtual_network_name = "vnet1"
  address_prefixes     = ["10.0.2.0/24"]
}

module "pip1" {
  depends_on          = [module.rgtodo1]
  source              = "../child/pip"
  public_ip_name      = "pip1"
  ip_location         = "Central India"
  resource_group_name = "rgtest1"
}

module "pip2" {
  depends_on          = [module.rgtodo1]
  source              = "../child/pip"
  public_ip_name      = "pip2"
  ip_location         = "Central India"
  resource_group_name = "rgtest1"
}

module "sqlserver" {
  depends_on          = [module.rgtodo1, module.key_vault, module.secret_username, module.secret_password]
  source              = "../child/sql_server"
  server_name         = "todoserver16"
  server_location     = "Central India"
  resource_group_name = "rgtest1"
  key_vault_name      = "kulvinderkey1"
  secret_name         = "dbusername"
  secret_password     = "dbpassword"
}

module "sql_database1" {
  depends_on          = [module.sqlserver]
  source              = "../child/sql_database"
  db_name             = "tododb"
  server_name         = "todoserver16"
  resource_group_name = "rgtest1"
}

module "todofrontendvm" {
  depends_on           = [module.pip1, module.subnet1, module.rgtodo1, module.key_vault, module.secret_username_vm, module.secret_password_vm]
  source               = "../child/todovm"
  nic_name             = "nic1"
  vm_location          = "Central India"
  resource_group_name  = "rgtest1"
  ip_name              = "ipconfig1"
  vm_name              = "vmfrontend"
  vm_size              = "Standard_B1s"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_sku            = "22_04-lts"
  image_version        = "latest"
  public_ip_name       = "pip1"
  virtual_network_name = "vnet1"
  subnet_name          = "frontendsubnet1"
  key_vault_name       = "kulvinderkey1"
  secret_name          = "vmusername"
  secret_password      = "vmpassword"
}

module "backendvm" {
  depends_on           = [module.pip2, module.subnet2, module.rgtodo1, module.key_vault, module.secret_username_vm, module.secret_password_vm]
  source               = "../child/todovm"
  nic_name             = "nic2"
  vm_location          = "Central India"
  resource_group_name  = "rgtest1"
  ip_name              = "ipconfig2"
  subnet_name          = "Backendsubnet1"
  virtual_network_name = "vnet1"
  public_ip_name       = "pip2"
  vm_name              = "vmbackend"
  vm_size              = "Standard_B1s"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_sku            = "22_04-lts"
  image_version        = "latest"
  key_vault_name       = "kulvinderkey1"
  secret_name          = "vmusername"
  secret_password      = "vmpassword"
}

module "key_vault" {
  depends_on          = [module.rgtodo1]
  source              = "../child/key_vault"
  key_vault_name      = "kulvinderkey1"
  key_location        = "Central India"
  resource_group_name = "rgtest1"
}

module "secret_username" {
  depends_on          = [module.key_vault, module.rgtodo1]
  source              = "../child/key_vault_secret"
  secret_name         = "dbusername"
  secret_value        = "kulvinderadmin"
  key_vault_name      = "kulvinderkey1"
  resource_group_name = "rgtest1"
}

module "secret_password" {
  depends_on          = [module.key_vault, module.rgtodo1]
  source              = "../child/key_vault_secret"
  secret_name         = "dbpassword"
  secret_value        = "P@ssw0rd1234!"
  key_vault_name      = "kulvinderkey1"
  resource_group_name = "rgtest1"
}

module "secret_username_vm" {
  depends_on          = [module.key_vault, module.rgtodo1]
  source              = "../child/key_vault_secret"
  secret_name         = "vmusername"
  secret_value        = "vmkulvinderadmin"
  key_vault_name      = "kulvinderkey1"
  resource_group_name = "rgtest1"
}

module "secret_password_vm" {
  depends_on          = [module.key_vault, module.rgtodo1]
  source              = "../child/key_vault_secret"
  secret_name         = "vmpassword"
  secret_value        = "VMP@ssw0rd1234!"
  key_vault_name      = "kulvinderkey1"
  resource_group_name = "rgtest1"
}