terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

resource "aws_s3_bucket" "east_s3" {
  bucket   = "jan-re-east-s3"
  provider = aws.us-east

  tags = {
    Owner = "jan-re"
  }
}

resource "aws_s3_bucket" "central_s3" {
  bucket = "jan-re-central-s3"

  tags = {
    Owner = "jan-re"
  }
}
