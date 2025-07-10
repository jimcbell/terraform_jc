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
resource "azurerm_static_web_app_custom_domain" "root" {
  static_web_app_id = azurerm_static_web_app.nyc_outings.id
  domain_name       = "nycoutings.com"
  validation_type   = "dns-txt-token"
}

resource "azurerm_static_web_app_custom_domain" "www" {
  static_web_app_id = azurerm_static_web_app.nyc_outings.id
  domain_name       = "www.nycoutings.com"
  validation_type   = "dns-txt-token"
}

resource "azurerm_dns_zone" "nyc_outings" {
  name = "nycoutings.com"

  resource_group_name = azurerm_resource_group.nyc_outings.name

  tags = local.tags
}

resource "azurerm_dns_cname_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.nyc_outings.name
  resource_group_name = azurerm_resource_group.nyc_outings.name
  ttl                 = 300
  record              = azurerm_static_web_app.nyc_outings.default_host_name
}

resource "azurerm_dns_a_record" "apex" {
  name                = "@"
  zone_name           = azurerm_dns_zone.nyc_outings.name
  resource_group_name = azurerm_resource_group.nyc_outings.name
  ttl                 = 86400 # 24 hours
  # records             = []    # Required, but empty when using alias
  target_resource_id = azurerm_static_web_app.nyc_outings.id
}
