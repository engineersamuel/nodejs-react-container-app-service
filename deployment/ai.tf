resource "azurerm_application_insights" "this" {
  name                = local.app_insights_name
  location            = var.region
  resource_group_name = azurerm_resource_group.this.name
  application_type    = "web"
  tags                = var.tags
}
