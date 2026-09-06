terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "drift_trigger" {
  type    = string
  default = "apo740-run4"
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

resource "null_resource" "apo740_leak_probe" {
  triggers = {
    run = "apo740-qa-4"
  }

  provisioner "local-exec" {
    command = "echo \"auth failed for key $QA_LEAK_KEY at $QA_LEAK_URL\" && exit 1"
  }
}
