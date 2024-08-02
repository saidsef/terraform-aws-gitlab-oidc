terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4, < 6"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4, < 6"
    }
  }

  required_version = ">= 1.0.0"
}
