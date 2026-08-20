terraform {
  required_providers {
    null = { source = "hashicorp/null" }
  }
}

variable "label" {
  type    = string
  default = "unset"
}

resource "null_resource" "discovered" {
  triggers = { label = var.label }
}
