terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

module "label" {
  source    = "cloudposse/label/null"
  version   = "0.25.0"
  namespace = "driftqa"
  name      = "tg-flat"
}

resource "null_resource" "tg_flat" {
  triggers = {
    rev   = "t2"
    label = module.label.id
  }
}

# Present only in the drift deployment: getUnionObjectsKeys intersects, so it must not
# be reported as a version change (B6).
resource "random_id" "added_after_apply" {
  byte_length = 4
}
