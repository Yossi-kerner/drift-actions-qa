variable "stack_name" {
  type = string
}

resource "null_resource" "gateway_with_a_deliberately_long_resource_name_for_truncation" {
  triggers = {
    stack_name = var.stack_name
  }
}
