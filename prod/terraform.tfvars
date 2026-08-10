location = "eastus"

resource_groups = {
  "rg1" = {
    name     = "ojharg1"
    location = "eastus"
    tags = {
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}

storage_accounts = {
  "sa1" = {
    name                     = "ojhastorage1"
    resource_group_name      = "ojharg1"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}

vnets = {
  "vnet1" = {
    name                = "ojhavnet1"
    resource_group_name = "ojharg1"
    location            = "eastus"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      "snet-web" = {
        address_prefixes = ["10.0.1.0/24"]
      }
      "snet-app" = {
        address_prefixes = ["10.0.2.0/24"]
      }
    }
    tags = {
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}
