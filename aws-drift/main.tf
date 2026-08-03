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
