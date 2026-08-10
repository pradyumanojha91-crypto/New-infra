# 🚀 New-infra: Azure Modular Infrastructure with Terraform

Welcome to **New-infra**! This repository provides an enterprise-grade, modular Terraform architecture for deploying Azure infrastructure across **Pre-Production** (`preprod`) and **Production** (`prod`) environments using reusable **Child Modules** powered by `for_each` loops.

---

## 📁 Repository Structure

```text
New-infra/
├── 📦 modules/                     # Reusable Child Modules
│   ├── 🏛️ resource_group/           # Resource Group module (azurerm_resource_group)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── 💾 storage_account/          # Storage Account module (azurerm_storage_account)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── 🌐 virtual_network/          # Virtual Network & Subnets module (azurerm_virtual_network)
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── 🧪 preprod/                     # Pre-Production Parent (Root) Module
│   ├── main.tf
│   ├── providers.tf                # AzureRM v4.x Provider
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
└── 🏭 prod/                        # Production Parent (Root) Module
    ├── main.tf
    ├── providers.tf                # AzureRM v4.x Provider
    ├── variables.tf
    ├── outputs.tf
    └── terraform.tfvars
```

---

## 🛠️ Tech Stack & Provider

- **IaC Tool**: [Terraform](https://www.terraform.io/) `>= 1.5.0` ⚡
- **Cloud Provider**: [AzureRM](https://registry.terraform.io/providers/hashicorp/azurerm/latest) `~> 4.0` ☁️

---

## ⚡ Core Features & `for_each` Dynamic Loops

All child modules are designed to dynamically iterate over input maps using Terraform's **`for_each`** construct.

| Resource Type | Module Path | Managed Resources | Configured Names | Region |
| :--- | :--- | :--- | :--- | :--- |
| **Resource Group** 🏛️ | `modules/resource_group` | `azurerm_resource_group` | `ojharg1` | `eastus` |
| **Storage Account** 💾 | `modules/storage_account` | `azurerm_storage_account` | `ojhastorage1` | `eastus` |
| **Virtual Network** 🌐 | `modules/virtual_network` | `azurerm_virtual_network` & `azurerm_subnet` | `ojhavnet1` | `eastus` |

---

## ⚙️ How to Deploy

### 1️⃣ Prerequisites 📋
- Install [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) (`>= 1.5.0`)
- Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) and authenticate:
  ```bash
  az login
  ```

### 2️⃣ Deploy Pre-Production Environment 🧪

```bash
# Navigate to preprod directory
cd preprod

# Initialize Terraform & download AzureRM provider plugins
terraform init

# Validate configuration
terraform validate

# Preview infrastructure changes
terraform plan

# Apply infrastructure changes
terraform apply
```

### 3️⃣ Deploy Production Environment 🏭

```bash
# Navigate to prod directory
cd prod

# Initialize Terraform
terraform init

# Preview & Apply
terraform plan
terraform apply
```

---

## 📊 Environment Configurations Summary

| Setting | 🧪 Pre-Production (`preprod`) | 🏭 Production (`prod`) |
| :--- | :--- | :--- |
| **Resource Group** | `ojharg1` | `ojharg1` |
| **Location** | `eastus` | `eastus` |
| **Storage Replication** | `LRS` (Locally Redundant) | `GRS` (Geo-Redundant) |
| **VNet Address Space** | `10.10.0.0/16` | `10.0.0.0/16` |
| **Subnets** | `10.10.1.0/24` (`snet-default`) | `10.0.1.0/24` (`snet-web`), `10.0.2.0/24` (`snet-app`) |

---

## 🤝 Contributing & Guidelines 📝

- Follow standard formatting by running `terraform fmt -recursive` before committing changes.
- Ensure sensitive secrets are not checked into version control.

Happy Terraforming! 🎉