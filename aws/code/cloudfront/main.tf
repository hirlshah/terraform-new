resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = var.bucket_domain_name
}

locals {
  s3_origin_id = var.bucket_domain_name
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.bucket_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
       origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
     }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "my distribution"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = var.bucket_domain_name
    prefix          = "myprefix"
  }

#  aliases = ["mysite.example.com", "yoursite.example.com"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = {
    Environment = "production"
  }
  viewer_certificate {
    acm_certificate_arn = var.viewer_certificate_arn
    ssl_support_method = "sni-only"

  }

}
