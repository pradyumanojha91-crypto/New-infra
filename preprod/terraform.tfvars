location = "eastus"

resource_groups = {
  "rg1" = {
    name     = "ojharg1"
    location = "eastus"
    tags = {
      Environment = "preprod"
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
    account_replication_type = "LRS"
    tags = {
      Environment = "preprod"
      ManagedBy   = "Terraform"
    }
  }
}

vnets = {
  "vnet1" = {
    name                = "ojhavnet1"
    resource_group_name = "ojharg1"
    location            = "eastus"
    address_space       = ["10.10.0.0/16"]
    subnets = {
      "snet-default" = {
        address_prefixes = ["10.10.1.0/24"]
      }
    }
    tags = {
      Environment = "preprod"
      ManagedBy   = "Terraform"
    }
  }
}
