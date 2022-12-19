output "compute" {
  value = [for x in module.compute[*] : x]
}
