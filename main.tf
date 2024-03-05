
module "azure_resources" {
  source = "./azure_resources"  # Path to your module directory

  # Input variables for the module
   resource_group_name    = var.resource_group_name
  resource_group_location = var.resource_group_location
  storage_account_name    = var.storage_account_name
  blob_container_name     = var.blob_container_name
}
