module "resg1" {

  source = "../../child_module/resource_group"
  rgs    = var.rgs

}

module "virnet1" {

  depends_on = [module.resg1]
  source     = "../../child_module/vnet"
  vnets      = var.vnets

}

module "subnet12" {

  depends_on = [module.virnet1]
  source     = "../../child_module/subnet"
  snets      = var.snets

}

module "pip" {

  depends_on = [module.resg1]
  source     = "../../child_module/public_ip"
  pip        = var.pip

}
