output "ntwrk_interface_ids" {
  description = "name of vnet"
  value = ["${azurerm_network_interface.main.id}"]
}