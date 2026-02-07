output "vnet_id" {
  value = azurerm_virtual_network.Vnet-dev.id
}

output "subnet_ids" {
  value = {
    for k,v in azurerm_subnet.subnet-dev :
    k=>v.id
  }
}