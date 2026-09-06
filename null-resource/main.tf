terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "drift_trigger" {
  type    = string
  default = "apo740-b3"
}

variable "secret_trigger" {
  type      = string
  default   = "baseline"
  sensitive = true
}

resource "null_resource" "drift_qa" {
  triggers = {
    drift_trigger  = var.drift_trigger
    secret_trigger = sha256(var.secret_trigger)
  }
}

variable "apo603_c1" {
  type    = string
  default = "c1"
}

variable "apo740_secret" {
  type    = string
  default = "unset"
}

resource "null_resource" "leak" {
  provisioner "local-exec" {
    command = "echo k=${var.apo740_secret} && exit 1"
  }
}
