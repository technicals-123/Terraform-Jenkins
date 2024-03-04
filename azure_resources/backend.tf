terraform {
  backend "azurerm" {
    storage_account_name =  "storageaccounttriall"
    container_name       = "storageaccounttriallcontainer"
    key                  = "terraform.tfstate"
  }
}
 
 
 
 
 
 
