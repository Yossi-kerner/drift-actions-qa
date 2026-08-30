variable "region" {
  type = string
}

variable "servers" {
  type = set(string)
}

resource "null_resource" "server" {
  for_each = var.servers

  triggers = {
    region = var.region
    fqdn   = each.key
  }
}
