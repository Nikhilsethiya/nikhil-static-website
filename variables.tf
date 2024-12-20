variable "location" {
  description = "Location"
  type = string 
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type = string     
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type = string   
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type = string   
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type = string   
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type = string   
}
variable "static_website" {
  description = "static website page"
  type = string   
}
variable "error_page" {
  description = "error-page"
  type = string   
}
variable "static_web_content" {
  description = "static website folder"
  type = string  
}