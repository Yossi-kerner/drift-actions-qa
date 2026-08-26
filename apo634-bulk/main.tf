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
  count = 60

  triggers = {
    idx = tostring(count.index)
  }
}

resource "random_pet" "extra" {
  count = 5
}
