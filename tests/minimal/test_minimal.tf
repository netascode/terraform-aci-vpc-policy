terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "VPC1"
}

data "aci_rest" "vpcInstPol" {
  dn = "uni/fabric/vpcInst-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "vpcInstPol" {
  component = "vpcInstPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest.vpcInstPol.content.name
    want        = module.main.name
  }
}
