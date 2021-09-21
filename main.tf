resource "aci_rest" "vpcInstPol" {
  dn         = "uni/fabric/vpcInst-${var.name}"
  class_name = "vpcInstPol"
  content = {
    name      = var.name
    deadIntvl = var.peer_dead_interval
  }
}
