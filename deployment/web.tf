resource "azurerm_app_service_plan" "this" {
  name                = local.app_service_plan_name
  location            = var.region
  resource_group_name = azurerm_resource_group.this.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# resource "azurerm_app_service" "example" {
#   name                = "${var.prefix}-appservice"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   app_service_plan_id = azurerm_app_service_plan.example.id

#   site_config {
#     windows_fx_version = "DOCKER|mcr.microsoft.com/azure-app-service/samples/aspnethelloworld:latest"
#   }

#   app_settings = {
#     "DOCKER_REGISTRY_SERVER_URL"      = "https://mcr.microsoft.com",
#     "DOCKER_REGISTRY_SERVER_USERNAME" = "",
#     "DOCKER_REGISTRY_SERVER_PASSWORD" = "",
#   }
# }
resource "azurerm_app_service" "this" {
  name                = local.app_service_name
  location            = var.region
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.this.id
  tags                = var.tags
  https_only          = true

  site_config {
    linux_fx_version = local.webapp_site_config_linux_fx_verison
    ftps_state       = "Disabled"
    http2_enabled    = true
    acr_use_managed_identity_credentials = true
    health_check_path = "/api/health"
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${local.acr_name}.azurecr.io",
    # "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.this.admin_username,
    # "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.this.admin_password,
    # "WEBSITE_VNET_ROUTE_ALL"         = "1"
    "WEBSITE_NODE_DEFAULT_VERSION"   = "14-lts"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.this.instrumentation_key
    "NODE_ENV"                       = "production"
    "WEBSITES_PORT"                  = "3000"
  }

  identity {
    type = "SystemAssigned"
  }

  logs {
    failed_request_tracing_enabled  = true
    detailed_error_messages_enabled = true
  }

  # If this is set to true then the site will appear to silently fail to load, if you inspect the network in the browser
  # you'll see a 401.  For testing purposes we'll set this to false as auth is not required for the moment.
  auth_settings {
    enabled = false
  }


  # lifecycle {
  #   ignore_changes = [
  #     site_config,
  #     app_settings,
  #     auth_settings
  #   ]
  # }
}

resource "azurerm_role_assignment" "acr" {
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.this.id
  principal_id         = azurerm_app_service.this.identity[0].principal_id
}

# resource "azurerm_monitor_diagnostic_setting" "this" {
#   count = var.enable_diagnostics ? 1 : 0
#   name  = "${local.app_service_name}-diag"

#   target_resource_id         = azurerm_app_service.this.id
#   storage_account_id         = length(var.diagnostic_log_storage_account_id) > 0 ? var.diagnostic_log_storage_account_id : null
#   log_analytics_workspace_id = length(var.target_log_analytics_workspace_id) > 0 ? var.target_log_analytics_workspace_id : null

#   dynamic "log" {
#     for_each = var.diagnostic_log_categories

#     content {
#       category = log.value
#       enabled  = true

#       retention_policy {
#         enabled = length(var.diagnostic_log_storage_account_id) > 0 ? true : false
#         days    = length(var.diagnostic_log_storage_account_id) > 0 ? var.diagnostic_log_storage_retention : null
#       }
#     }
#   }

#   metric {
#     category = "AllMetrics"
#     enabled  = true

#     retention_policy {
#       enabled = length(var.diagnostic_log_storage_account_id) > 0 ? true : false
#       days    = length(var.diagnostic_log_storage_account_id) > 0 ? var.diagnostic_log_storage_retention : null
#     }
#   }
# }