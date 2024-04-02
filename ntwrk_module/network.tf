resource "azurerm_virtual_network" "main" {
  name = "${var.prefix}-network"
  address_space = ["10.0.0.0/16"]
  location = var.loc
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "internal" {
  name = "vnet1"
  resource_group_name = var.resource_group_name
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name = "${var.prefix}-nic"
  location = var.loc
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "terratestConfiguration"
    subnet_id = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "Dynamic"
  }
}