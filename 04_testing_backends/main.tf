terraform {

  backend "s3" {
    bucket = "jan-re-terraform-state-bucket"
    use_lockfile = true
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name     = "Terraform VPC"
    Exercise = "exercise1"
    NewTag   = "NewTag"
  }
}
