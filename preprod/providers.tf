terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Example backend configuration (uncomment when Azure storage backend is configured)
  # backend "azurerm" {
  #   resource_group_name  = "tfstate-rg"
  #   storage_account_name = "tfstatepreprodsa"
  #   container_name       = "tfstate"
  #   key                  = "preprod.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
