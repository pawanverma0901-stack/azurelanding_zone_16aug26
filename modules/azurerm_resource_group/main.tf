resource "azurerm_resource_group" "rg" {
  for_each = var.rgs

  name     = each.value.name
  location = each.value.location
}

resource "azurerm_storage_account" "sa" {
  depends_on = [azurerm_resource_group.rg]

  name                     = "testerkastorage20260816"
  resource_group_name      = azurerm_resource_group.rg["rg1"].name
  location                 = azurerm_resource_group.rg["rg1"].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}