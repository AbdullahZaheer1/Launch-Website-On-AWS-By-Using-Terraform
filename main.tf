terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}
provider "aws" {
  region = "eu-north-1"
}
resource "random_id" "mywebsite_id" {
  byte_length = 8
}
resource "aws_s3_bucket" "mywebsite" {
  bucket = "my-website-${random_id.mywebsite_id.hex}"
}
resource "aws_s3_bucket_public_access_block" "mywebsite_policy" {
  bucket = aws_s3_bucket.mywebsite.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.mywebsite.id
  policy = jsonencode({
    Version= "2012-10-17",
    Statement= [
        {
            Sid= "PublicReadGetObject",
            Effect= "Allow",
            Principal= "*",
            Action= "s3:GetObject",
            Resource= "${aws_s3_bucket.mywebsite.arn}/*"
        }
      ]
  })
}

resource "aws_s3_bucket_website_configuration" "mywebsite_config" {
  bucket = aws_s3_bucket.mywebsite.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_file" {
  bucket = aws_s3_bucket.mywebsite.id
  key    = "index.html"
  source = "./index.html" 
  content_type = "text/html"
}
resource "aws_s3_object" "style_file" {
  bucket = aws_s3_bucket.mywebsite.id
  key    = "style.css"
  source = "./style.css" 
  content_type = "text/css"
}


output "website_endpoint" {
  value = "${aws_s3_bucket_website_configuration.mywebsite_config.website_endpoint}/index.html"
}

