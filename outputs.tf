output "dn" {
  value       = aci_rest.vpcInstPol.id
  description = "Distinguished name of `vpcInstPol` object."
}

output "name" {
  value       = aci_rest.vpcInstPol.content.name
  description = "VPC policy name."
}
