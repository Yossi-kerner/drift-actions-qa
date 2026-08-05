terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name_suffix" {
  type = string
}

provider "aws" {
  region = var.region
}

resource "aws_ssm_parameter" "drift_a" {
  name  = "/drift-actions-qa/${var.name_suffix}/param-a"
  type  = "String"
  value = "managed-by-env0"

  tags = {
    drift_qa = "baseline"
  }
}

resource "aws_ssm_parameter" "drift_b" {
  name  = "/drift-actions-qa/${var.name_suffix}/param-b"
  type  = "String"
  value = "managed-by-env0"

  tags = {
    drift_qa = "baseline"
  }
}

module "nested" {
  source      = "./modules/nested-param"
  name_suffix = var.name_suffix
}

# APO-403 QA: a parameter whose terraform id (the SSM name) exceeds 50 characters,
# so the Unmanaged Change tab must truncate it and show a tooltip.
resource "aws_ssm_parameter" "long_id" {
  name  = "/drift-actions-qa/${var.name_suffix}/a-deliberately-long-parameter-name-for-truncation-check"
  type  = "String"
  value = "managed-by-env0"

  tags = {
    drift_qa = "apo-403-truncation"
  }
}
