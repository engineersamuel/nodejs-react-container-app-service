#--------------------------------------------------------------
# Local Vars
#--------------------------------------------------------------
locals {
  resource_prefix = lower(var.name)
}

locals {
  app_service_plan_name   = "${local.resource_prefix}-asp"
  app_service_name        = "${local.resource_prefix}-webapp"
  app_insights_name       = "${local.resource_prefix}-ai"
  acr_name                = "${local.resource_prefix}acr"
}

locals {
  # NOTE: This format is extremely specific and particular, it must be in this EXACT format for ACR.
  webapp_site_config_linux_fx_verison = "DOCKER|${local.acr_name}.azurecr.io/${var.container_name}:latest"
  default_webapp_app_settings_prod = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${local.acr_name}.azureacr.io",
    "WEBSITE_VNET_ROUTE_ALL"         = "1"
    "WEBSITES_PORT"                  = "3000"
    "WEBSITE_NODE_DEFAULT_VERSION"   = "14-lts"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.this.instrumentation_key
    "NODE_ENV"                       = "production"
  }
  default_webapp_app_settings_staging = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${local.acr_name}.azureacr.io",
    "WEBSITE_VNET_ROUTE_ALL"         = "1"
    "WEBSITES_PORT"                  = "3000"
    "WEBSITE_NODE_DEFAULT_VERSION"   = "14-lts"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.this.instrumentation_key
    "NODE_ENV"                       = "production"
  }
  merged_webapp_app_settings_prod    = merge(local.default_webapp_app_settings_prod, var.webapp_app_settings_prod)
  merged_webapp_app_settings_staging = merge(local.default_webapp_app_settings_staging, var.webapp_app_settings_staging)
}
