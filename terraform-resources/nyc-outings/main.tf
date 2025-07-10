resource "azurerm_resource_group" "nyc_outings" {
  name     = local.resource_group_name
  location = local.location
}


resource "azurerm_static_web_app" "nyc_outings" {
  name = local.web_app_name

  resource_group_name = azurerm_resource_group.nyc_outings.name
  location            = azurerm_resource_group.nyc_outings.location

  tags = local.tags
}

resource "azurerm_dns_zone" "nyc_outings" {
  name                = "nycoutings.com"
  resource_group_name = azurerm_resource_group.nyc_outings.name

  tags = local.tags
}
