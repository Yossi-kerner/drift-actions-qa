terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

variable "stack_name" {
  type = string
}

variable "gen" {
  type    = string
  default = "2"
}

module "edge" {
  source     = "../../modules/edge"
  stack_name = var.stack_name
  gen        = var.gen
}

output "vpc_id" {
  value = "vpc-${var.stack_name}"
}
