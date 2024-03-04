terraform {
  backend "azurerm" {
    resource_group_name = "new-resource"
    storage_account_name = "mystorageaccounti"
    container_name       = "statefile"
    key                  = "terraform.tfstate"
    # Add other backend configuration options as needed
  }
}
