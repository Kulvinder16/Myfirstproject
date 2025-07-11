variable "nic_name" {
  description = "Name of the network interface"
  type        = string
  
}
variable "vm_location" {
  description = "Location of the network interface"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "ip_name" {
  description = "Name of the IP configuration"
  type        = string
}
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}
variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
}
variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
}
variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
}

variable "image_version" {
  description = "Version of the VM image"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}
variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}
variable "public_ip_name" {
  description = "Name of the IP configuration"
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