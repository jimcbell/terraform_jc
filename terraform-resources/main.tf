terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "MGT-E1-RG"

    storage_account_name = "mgte1tfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}


module "nyc_outtings" {
  source = "./nyc-outings"
}
