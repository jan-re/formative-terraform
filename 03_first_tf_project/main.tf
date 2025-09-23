terraform {
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


provider "random" {
}

resource "random_id" "s3_name" {
  byte_length = 8
}

resource "aws_s3_bucket" "s3_01" {
  bucket = random_id.s3_name.hex

  tags = {
    Environment = "Dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.s3_01.bucket
}