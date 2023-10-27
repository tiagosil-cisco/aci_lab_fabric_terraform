
module "aci_fabric_access_policies" {

  source = "./modules/aci_fabric_access_policies"

  credentials  = var.credentials
  project_name = local.project_name

}

module "aci_fabric_policies" {

  source = "./modules/aci_fabric_policies"

  credentials  = var.credentials
  project_name = local.project_name

}