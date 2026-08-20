terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "drift_trigger" {
  type    = string
  default = "baseline"
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

variable "apo603_a1" {
  type    = string
  default = "a1"
}

variable "apo603_a5" {
  type    = string
  default = "a5"
}

variable "apo603_c4" {
  type    = string
  default = "c4"
}
