provider "azurerm" {
  features {}
}

module "azure_resources" {
  source = "./azure_resources"  # Path to your module directory

  # Input variables for the module
  resource_group_name        = "example_rg"
  resource_group_location    = "Central India"
  storage_account_name       = "storageaccounttriall"
  blob_container_name        = "storageaccounttriallcontainer"
}
