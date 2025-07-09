terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = local.resource_group_name

      storage_account_name = local.tf_state.storage_account_name
      container_name       = local.tf_state.container_name
      key                  = local.tf_state.key
  }

}

provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "management" {
    name = local.resource_group_name
}

module "nyc_outtings" {
    source = "./nyc_outtings"
}