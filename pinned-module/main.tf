terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

module "label" {
  source    = "cloudposse/label/null"
  version   = "0.24.1"
  namespace = "driftqa"
  name      = "pinned-module"
}

resource "null_resource" "pinned_module" {
  triggers = {
    rev   = "m1"
    label = module.label.id
  }
}
