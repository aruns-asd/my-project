resource "azurerm_resource_group" "resource_group1" {
  name     = "rg-tf-vnet"
  location = var.location
}

resource "azurerm_network_security_group" "network_security_group1" {
  name                = "nsg1"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group1.name
  depends_on = [ azurerm_resource_group.resource_group1 ]
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "demo-vnet1"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.network_security_group1.id
  }

  tags = {
    environment = "demo"
  }
}