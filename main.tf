terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.94.0"
    }
  }
  required_version = ">= 0.14.9"
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatevzzap"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
