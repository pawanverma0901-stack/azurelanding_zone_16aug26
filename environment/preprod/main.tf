module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  source     = "../../modules/azurerm-vnet"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}

module "subnets" {
  source     = "../../modules/azurerm_subnets"
  subnets    = var.subnets
  depends_on = [module.vnet]
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.resource_group]
}

module "nsg" {
  source     = "../../modules/azurerm_nsg"
  nsgs       = var.nsgs
  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
  depends_on = [module.subnets, module.public_ip]
}
