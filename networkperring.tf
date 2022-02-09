resource "azurerm_resource_group" "pf-network-tfdemo-01" {
  name     = "pf-peeredvnets-demo-rg"
  location = "ukwest"
}

resource "azurerm_virtual_network" "pf-web-tier-01" {
  name                = "pf-web-tier"
  resource_group_name = azurerm_resource_group.pf-network-tfdemo-01.name
  address_space       = ["10.120.1.0/24"]
  location            = "ukwest"
}

resource "azurerm_virtual_network" "pf-db-tier-01" {
  name                = "pf-db-tier"
  resource_group_name = azurerm_resource_group.pf-network-tfdemo-01.name
  address_space       = ["10.140.2.0/24"]
  location            = "ukwest"
}

resource "azurerm_virtual_network_peering" "pf-web-2-db" {
  name                      = "pf-web-2-db"
  resource_group_name       = azurerm_resource_group.pf-network-tfdemo-01.name
  virtual_network_name      = azurerm_virtual_network.pf-web-tier-01.name
  remote_virtual_network_id = azurerm_virtual_network.pf-db-tier-01.id
}

resource "azurerm_virtual_network_peering" "pf-db-2-web" {
  name                      = "pf-db-2-web"
  resource_group_name       = azurerm_resource_group.pf-network-tfdemo-01.name
  virtual_network_name      = azurerm_virtual_network.pf-db-tier-01.name
  remote_virtual_network_id = azurerm_virtual_network.pf-web-tier-01.id
}
