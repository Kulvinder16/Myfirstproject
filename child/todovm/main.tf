

resource "azurerm_network_interface" "nic1" {
  name                = var.nic_name
  location            = var.vm_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "todovmk" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var. vm_location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.secret_username.value
  admin_password      = data.azurerm_key_vault_secret.secret_password.value
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
)

}

# resource "azurerm_virtual_machine" "standardvm" {
#   name                  = var.vm_name
#   location              = var.vm_location
#   resource_group_name   = var.resource_group_name
#   network_interface_ids = [azurerm_network_interface.nic1.id]
# vm_size = var.vm_size

#   storage_image_reference {
#     publisher = var.image_publisher
#     offer     = var.image_offer
#     sku       = var.image_sku
#     version   = var.image_version
#   }

#     storage_os_disk {
#         name              = "${var.vm_name}-osdisk"
#         caching           = "ReadWrite"
#         create_option     = "FromImage"
#         managed_disk_type = "Standard_LRS"
#     }

#   os_profile {
#     computer_name  = var.vm_name
#     admin_username = var.user_name
#     admin_password = var.password
#   }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
# }
