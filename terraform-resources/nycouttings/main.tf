resource "azurerm_static_web_app" "example" {
  name                = local.web_app_name

  resource_group_name = local.resource_group_name
  location            = local.location

  tags = local.tags
}