resource "azurerm_resource_group" "resource_group1" {
  name     = var.rgname
  location = var.location
  tags = var.tags

}