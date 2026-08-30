terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "servers" {
  type    = set(string)
  default = []
}

module "ns-cluster" {
  source  = "./modules/cluster"
  servers = var.servers
}
