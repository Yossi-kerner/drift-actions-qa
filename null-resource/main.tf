terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "drift_trigger" {
  type    = string
  default = "apo740-run3"
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

resource "null_resource" "apo740_failing_apply" {
  triggers = {
    run = "apo740-qa-3"
  }

  provisioner "local-exec" {
    command = "echo 'APO-740 QA deliberate apply failure: this provisioner prints a very long single line so that the generated commit check description exceeds the two hundred character cap enforced at the write boundary in put-commit-check, exercising the truncation and the ANSI and box-drawing stripping together' && exit 1"
  }
}
