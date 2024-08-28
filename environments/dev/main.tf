module "resourcegroup" {
  source   = "../../modules/resourcegroup"
  rgname   = var.resourcegroupname
  location = var.location
  tags = var.tags
}

module "virtualnetwork" {
  source        = "../../modules/vnet"
  location      = var.location
  address_space = var.address
  rgname        = var.resourcegroupname
  nsg_id        = module.NSG.nsg_id
  depends_on    = [module.resourcegroup]
}
module "NSG" {
  source     = "../../modules/nsg"
  location   = var.location
  rgname     = var.resourcegroupname
  depends_on = [module.resourcegroup]
}