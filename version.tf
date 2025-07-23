terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "87b95067-795f-408e-9870-ad7cc14078be"
  tenant_id       = "3b2abaf9-c61f-4970-a1dc-d6ac874c4968"
}