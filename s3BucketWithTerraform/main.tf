# Define an S3 bucket with a custom name
resource "aws_s3_bucket" "bucket" {
  bucket = "aditya-kumar-singh-bucket"  # S3 bucket name
}

# Upload an object (home.html) to the defined S3 bucket
resource "aws_s3_object" "home_object" {
  bucket          = aws_s3_bucket.bucket.id  # Reference to the S3 bucket
  key             = "home.html"  # Object key name
  source          = "home.html"  # Source file on the local machine
  content_type    = "text/html"  # Content type of the object
  content_disposition = "inline"  # Display inline in browser
}

# Upload an error object (error.html) to the S3 bucket
resource "aws_s3_object" "BadResponse_object" {
  bucket          = aws_s3_bucket.bucket.id  # Reference to the S3 bucket
  key             = "BadResponse.html"  # Object key name
  source          = "BadResponse.html"  # Source file on the local machine
  content_type    = "text/html"  # Content type of the object
  content_disposition = "inline"  # Display inline in browser
}

# Define a bucket policy that allows public access for reading objects
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket      = aws_s3_bucket.bucket.id  # Reference to the S3 bucket
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
            ]
        }
    ]
}
EOF
}

# Configure the S3 bucket as a static website with home and BadResponse pages
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id  # Reference to the S3 bucket

  index_document {
    suffix = "home.html"  # Index document (home page)
  }

  error_document {
    key = "BadResponse.html"  # Error document to display on error
  }
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
  depends_on = [ aws_s3_bucket_ownership_controls.ownership ]
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}