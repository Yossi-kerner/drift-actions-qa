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

module "edge" {
  source     = "./edge"
  stack_name = var.stack_name
}

module "core" {
  source     = "./edge"
  stack_name = var.stack_name
}

output "vpc_id" {
  value = "vpc-${var.stack_name}"
}
