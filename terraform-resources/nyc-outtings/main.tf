resource "azurerm_resource_group" "nyc_outtings" {
    name = local.resource_group_name
    location = local.location
}


resource "azurerm_static_web_app" "example" {
  name                = local.web_app_name

  resource_group_name = azurerm_resource_group.nyc_outtings.name
  location            = azurerm_resource_group.nyc_outtings.location

  tags = local.tags
}