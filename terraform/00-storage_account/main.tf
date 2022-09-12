locals {
  postfix         = "${var.workload}-${var.environment}-${var.location}"
  postfix_no_dash = replace(local.postfix, "-", "")
  location        = var.location == "ewu" ? "westeurope" : "northeurope"
}
output "postfix" {
  value = "rg-${local.postfix}"
}

resource "azurerm_resource_group" "rg_storage_account" {
  name     = "rg-${local.postfix}"
  location = local.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "st${local.postfix_no_dash}"
  resource_group_name      = azurerm_resource_group.rg_storage_account.name
  location                 = azurerm_resource_group.rg_storage_account.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "sc-${local.postfix}"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

##resource "azurerm_storage_blob" "example" {
##  name                   = "my-awesome-content.zip"
##  storage_account_name   = azurerm_storage_account.example.name
##  storage_container_name = azurerm_storage_container.example.name
##  type                   = "Block"
##  source                 = "some-local-file.zip"
##}