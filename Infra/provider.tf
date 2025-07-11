terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rgkulvinder"
    storage_account_name = "stgkulvinder1"
    container_name       = "container1"
    key                  = "prod.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "32bd2260-8449-4526-af4d-a40b9179ba7c"
}
