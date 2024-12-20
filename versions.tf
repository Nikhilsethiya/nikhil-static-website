# Terraform Block
terraform {
  required_version = ">= 1.5.0" # Updated to a more recent version of Terraform
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0" # Latest major version for AzureRM provider
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0" # Latest version for Random provider
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.3.0" # Latest version for Null provider
    }
  }
}
