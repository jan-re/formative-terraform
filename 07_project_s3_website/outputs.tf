output "s3_website" {
    value = aws_s3_bucket_website_configuration.static_website.website_endpoint
}