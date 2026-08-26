terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

resource "null_resource" "renamed" {
  triggers = {
    name = "apo634-moved"
  }
}

moved {
  from = null_resource.original
  to   = null_resource.renamed
}

resource "terraform_data" "imported" {}

import {
  to = terraform_data.imported
  id = "apo634-import"
}
