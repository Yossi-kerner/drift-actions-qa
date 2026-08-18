terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

module "label" {
  source    = "cloudposse/label/null"
  version   = "0.24.1"
  namespace = "driftqa"
  name      = "tg-flat"
}

resource "null_resource" "tg_flat" {
  triggers = {
    rev   = "t1"
    label = module.label.id
  }
}
