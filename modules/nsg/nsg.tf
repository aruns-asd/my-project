resource "azurerm_network_security_group" "network_security_group1" {
  name                = "nsg1"
  location            = var.location
  resource_group_name = var.rgname
}
