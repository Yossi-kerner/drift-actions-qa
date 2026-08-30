terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "null_resource" "bulk" {
  count = 0

  triggers = {
    idx = tostring(count.index)
  }
}

resource "random_pet" "extra" {
  count = 0
}
