terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "management" {
  name     = "MGT-E1-RG"
  location = "East US"
}


resource "azurerm_storage_account" "tf_state" {
  name                            = "mgte1tfstate"
  resource_group_name             = azurerm_resource_group.management.name
  location                        = azurerm_resource_group.management.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "dev"
  }
}
data "azurerm_client_config" "current" {}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_state.name
  container_access_type = "private"
}