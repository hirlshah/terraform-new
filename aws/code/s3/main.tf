# Configure AWS provider
provider "aws" {
  region = var.region
}

# Create an S3 bucket
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_tag
  }
}

