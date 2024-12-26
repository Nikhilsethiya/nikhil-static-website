terraform {
  backend "azurerm" {
    resource_group_name  = "myResourceGroupBackend"
    storage_account_name = "nikhilbackendstorage"
    container_name       = "backendcontainer"
    key                  = "prod.terraform.tfstate"
  }
}