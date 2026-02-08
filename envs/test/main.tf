locals {
  environment = "test"
  common_tags = merge(
    {
        environment = local.environment
        managed_by = "terraform"
    },
    var.tags
  )
}

module "resource_group" {
  source   = "../../modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = "${var.resource_group_name}-vnet"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = [var.vnet_cidr]
  tags                = local.common_tags
}

module "subnets" {
  source               = "../../modules/subnet"
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.vnet.name
  subnets              = var.subnets
}