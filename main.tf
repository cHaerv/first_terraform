
resource "azurerm_resource_group" "terraTestRg" {
  name = var.resource_group_name
  location = "ukSouth"

  tags = {
    Owner = "connor"
  }
}

module "network" {
  source = "./ntwrk_module"

}


resource "azurerm_virtual_machine" "main" {
  name = "${var.prefix}-vm"
  location = "${azurerm_resource_group.terraTestRg.location}"
  resource_group_name = "${azurerm_resource_group.terraTestRg.name}"
  network_interface_ids = module.network.ntwrk_interface_ids
  vm_size  = "Standard_DS1_v2"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-focal"
    sku = "20_04-lts-gen2"
    version = "20.04.202403072"
  }

  storage_os_disk {
    name = "myosdisk1"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    Owner = "Connor"
  }
}

