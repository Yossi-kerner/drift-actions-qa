variable "name_suffix" {
  type = string
}

resource "aws_ssm_parameter" "nested" {
  name  = "/drift-actions-qa/${var.name_suffix}/nested/param"
  type  = "String"
  value = "managed-by-env0"

  tags = {
    drift_qa = "baseline"
  }
}
