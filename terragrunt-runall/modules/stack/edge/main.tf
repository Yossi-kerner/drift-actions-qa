variable "stack_name" {
  type = string
}

resource "null_resource" "gateway" {
  triggers = {
    stack_name = var.stack_name
  }
}

output "gateway_id" {
  value = null_resource.gateway.id
}
