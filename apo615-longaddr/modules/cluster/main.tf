variable "servers" {
  type = set(string)
}

module "ns-region-phx" {
  for_each = toset(["us-phoenix-1"])
  source   = "../region"
  region   = each.key
  servers  = var.servers
}
