provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name = var.bucket_name
}
