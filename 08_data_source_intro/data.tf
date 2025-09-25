data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["099720109477"] # Owner is "Canonical"

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_caller_identity" "current_identity" {}

data "aws_region" "current_region" {}

data "aws_vpc" "prod_vpc" {
  tags = {
    "Name" = "console-managed"
    "Env"  = "Prod"
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_iam_policy_document" "s3_read_policy" {
  statement {
    sid = "PublicReadGetObject"

    actions = ["s3:GetObject", ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = ["arn:aws:s3:::*/*"]
  }
}
