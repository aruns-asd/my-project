resource "azurerm_virtual_network" "vnet1" {
  name                = "demo-vnet1"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = var.address_space
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name           = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group = var.nsg_id
  }

  tags = {
    environment = "demo"
  }
}