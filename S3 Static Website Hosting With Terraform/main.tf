terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# S3 Bucket
resource "aws_s3_bucket" "static_site" {
  bucket        = "freshwebsite1"      # Must be globally unique
  force_destroy = true
}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.static_site.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Static website config (separated in v6+)
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }
}

# Allow public access at bucket level
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload index.html (no ACL - v6+ uses Object Ownership)
resource "aws_s3_object" "index_file" {
  bucket       = aws_s3_bucket.static_site.id
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
}

# OUTPUT: Website URL
output "website_url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}
