
module "aci_fabric_access_policies" {

  source = "./modules/aci_fabric_access_policies"

  credentials  = var.credentials
  project_name = local.project_name

}



module "aci_inband_mgmt" {
  depends_on = [module.aci_fabric_access_policies]

  source = "./modules/aci_inband_mgmt"

  credentials  = var.credentials
  project_name = local.project_name

}

module "aci_fabric_policies" {
  depends_on = [module.aci_inband_mgmt]

  source = "./modules/aci_fabric_policies"

  credentials  = var.credentials
  project_name = local.project_name

}