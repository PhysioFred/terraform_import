terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
  required_version = ">= 1.11.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

# Amazon Connect Instance
resource "aws_connect_instance" "existing" {
  instance_alias               = "freds-call-centre"
  identity_management_type     = "CONNECT_MANAGED"
  inbound_calls_enabled        = true
  outbound_calls_enabled       = true
  contact_flow_logs_enabled    = true
  multi_party_conference_enabled = true
}
