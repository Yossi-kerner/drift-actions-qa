terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "revision" {
  type    = string
  default = "baseline"
}

resource "null_resource" "alpha" {
  triggers = { revision = var.revision }
}

resource "null_resource" "beta" {
  triggers = { revision = var.revision }
}

resource "null_resource" "gamma" {
  triggers = { revision = var.revision }
}

resource "null_resource" "delta" {
  triggers = { revision = var.revision }
}

output "alpha_id" {
  value = "alpha-${var.revision}"
}

output "beta_id" {
  value = "beta-${var.revision}"
}
