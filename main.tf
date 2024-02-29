
provider "azurerm" {
   features{}
}
resource "azurerm_resource_group" "example" {
  name     = "resourcenewgroup"
  location = "West Europe"
}
resource "azurerm_storage_account" "example1" {
  name                     = "storageaccountforfileonetwo"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
