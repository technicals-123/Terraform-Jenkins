variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default=   "example_rg1"
}

variable "resource_group_location" {
  description = "Location for the resource group"
  type        = string
default= "Central India"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
default= "storageaccounttrialll"
}

variable "blob_container_name" {
  description = "Name of the blob container"
  type        = string
 default= "storageaccounttrialllcontainer"
}
