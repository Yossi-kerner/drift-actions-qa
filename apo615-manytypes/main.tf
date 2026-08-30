terraform {
  required_providers {
    null   = { source = "hashicorp/null" }
    random = { source = "hashicorp/random" }
  }
}

resource "null_resource" "a" { count       = 0 }

resource "random_pet" "b" { count       = 0 }

resource "random_id" "c" {
  count       = 0
  byte_length = 4
}

resource "random_integer" "d" {
  count       = 0
  min   = 1
  max   = 100
}

resource "random_string" "e" {
  count       = 0
  length  = 8
  special = false
}

resource "random_uuid" "f" { count       = 0 }

resource "random_password" "g" {
  count       = 0
  length = 12
}

resource "terraform_data" "h" { count       = 0 }
