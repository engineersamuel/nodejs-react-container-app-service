#--------------------------------------------------------------
# Project variable definitions
#--------------------------------------------------------------
variable "name" {
  description = "A unique name for the module"
  type        = string
}

variable "region" {
  description = "The region to deploy the resources to"
  type        = string
  default     = "westus"
}

variable "tags" {
  description = "A map of tags to apply to any resources which allow tags"
  type        = map(string)
  default     = {}
}

variable "resource_group" {
  description = "This is the pre-existing resource group in Azure resources"
  type        = string
}

#--------------------------------------------------------------
# Web App
#--------------------------------------------------------------
# variable "webapp_site_config_linux_fx_verison" {
#   description = "(Optional) Linux App Framework and version for the App Service. "
#   type        = string
#   # default     = "DOCKER|mcr.microsoft.com/example:latest"
# }

variable "container_name" {
  description = "(Optional) Name of the container deployed to the ACR"
  type        = string
  default     = "example"
}

variable "webapp_app_settings_prod" {
  description = "Map of key/value pairs to be passed in as 'app settings' for the (Prod) App Service resource. This map gets merged with a default map, see `local.tf`"
  type        = map(string)
  default     = {}
}

variable "webapp_app_settings_staging" {
  description = "Map of key/value pairs to be passed in as 'app settings' for the (Staging) App Service resource. This map gets merged with a default map, see `local.tf`"
  type        = map(string)
  default     = {}
}