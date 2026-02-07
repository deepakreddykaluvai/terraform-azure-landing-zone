resource "azurerm_resource_group" "resource_group_dev" {
  name = var.resource_group_name
  location = var.location
  tags = local.common_tags
}

resource "azurerm_virtual_network" "Vnet-dev" {
  name = "${var.resource_group_name}-vnet"
  location = var.location
  resource_group_name = azurerm_resource_group.resource_group_dev.name
  address_space = [var.vnet_cidr]
  tags = local.common_tags
}

resource "azurerm_subnet" "subnet-dev" {
  for_each =  var.subnets

  name = each.key
  resource_group_name = azurerm_resource_group.resource_group_dev.name
  virtual_network_name = azurerm_virtual_network.Vnet-dev.name
  address_prefixes = [each.value.cidr]
}