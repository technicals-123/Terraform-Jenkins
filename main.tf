
provider "azurerm" {
   features{}
}
resource "azurerm_resource_group" "example" {
  name     = "rgnewres"
  location = "Central India"
}
resource "azurerm_storage_account" "example1" {
  name                     = "storageaccountforfilefour"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
