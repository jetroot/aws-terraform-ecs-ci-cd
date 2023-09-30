terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.18.1"
    }
  }

  required_version = ">= 1.5.7"
}


provider "aws" {
  region = "ap-southeast-2"
}
