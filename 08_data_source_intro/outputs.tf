# Information about a specific latest Ubuntu image owned by Canonical
output "ami" {
  value = data.aws_ami.latest_ami.image_id # Can be used to provision an EC2 instance with the latest AMI
}

# User-related information
output "account_id" {
  value = data.aws_caller_identity.current_identity.account_id
}

# User-related information
output "caller_arn" {
  value = data.aws_caller_identity.current_identity.arn
}

# User-related information
output "caller_user" {
  value = data.aws_caller_identity.current_identity.user_id
}

# Fetch information about the currently used region
output "active_region" {
  value = data.aws_region.current_region
}

# Fetch information about a manually created VPC
output "prod_vpc" {
  value = data.aws_vpc.prod_vpc.id
}

# Fetch information about currently available zones
output "zones" {
  value = data.aws_availability_zones.available_zones.names
}

# Fetch information about the fetched IAM policy
output "iam_policy" {
  value = data.aws_iam_policy_document.s3_read_policy.json
}
