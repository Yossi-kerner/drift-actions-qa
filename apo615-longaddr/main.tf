terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "servers" {
  type    = set(string)
  default = ["qos1-phx.eb.ucaas.tech"]
}

module "ns-cluster" {
  source  = "./modules/cluster"
  servers = var.servers
}
