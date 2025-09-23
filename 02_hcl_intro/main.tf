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

variable "bucket_name" {
  type    = string
  default = "s3-bucket-01"
}

locals {
  TagValue = "MyTag"
}

resource "aws_s3_bucket" "s3_01" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    LocalTag    = local.TagValue
  }
}

data "aws_s3_bucket" "s3_01" {
  bucket = "bucket.test.com"
}

output "s3_id" {
  value      = aws_s3_bucket.s3_01.id
  depends_on = [aws_s3_bucket.s3_01]
}

module "my_module" {
  source = "./module-example"
}
