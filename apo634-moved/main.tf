terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

resource "null_resource" "renamed_again" {
  triggers = {
    name = "apo634-moved"
  }
}

moved {
  from = null_resource.renamed
  to   = null_resource.renamed_again
}

resource "terraform_data" "imported" {}

resource "terraform_data" "imported_two" {}

import {
  to = terraform_data.imported_two
  id = "apo615-import-2"
}

resource "null_resource" "forces_drift" {
  triggers = {
    gen = "apo615"
  }
}
