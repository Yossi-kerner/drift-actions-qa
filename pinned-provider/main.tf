terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}

resource "null_resource" "pinned_provider" {
  triggers = {
    rev = "p2"
  }
}
