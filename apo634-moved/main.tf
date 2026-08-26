terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

resource "null_resource" "original" {
  triggers = {
    name = "apo634-moved"
  }
}
