terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}

module "label" {
  source    = "cloudposse/label/null"
  version   = "0.25.0"
  namespace = "driftqa"
  name      = "tf-both"
}

resource "null_resource" "tf_both" {
  triggers = {
    rev   = "t2"
    label = module.label.id
  }
}
