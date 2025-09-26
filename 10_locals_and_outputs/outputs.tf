# Can be read using `terraform output s3_bucket_name`
output "s3_bucket_name" {
  value       = aws_s3_bucket.project_bucket.bucket
  description = "The name of the S3 bucket"
  sensitive   = true # Will not appear in the logs due to this.
}
