resource "azurerm_container_registry" "this" {
  name                = local.acr_name
  resource_group_name = azurerm_resource_group.this.name
  location            = var.region
  sku                 = "Basic"
  admin_enabled       = true
}
