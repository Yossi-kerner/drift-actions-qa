variable "stack_name" {
  type = string
}

variable "gen" {
  type = string
}

resource "null_resource" "gateway" {
  triggers = {
    stack_name = var.stack_name
    gen        = var.gen
  }
}

output "gateway_id" {
  value = null_resource.gateway.id
}
