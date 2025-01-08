# Output the website endpoint URL for the S3 bucket to access the static website
output "endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"  # Website endpoint URL of the S3 bucket
}
