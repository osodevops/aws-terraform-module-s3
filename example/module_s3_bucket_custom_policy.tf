module "bucket" {
  source                  = "../"
  s3_bucket_name          = "example_bucket_name"
  s3_bucket_acl           = "private"
  s3_bucket_force_destroy = false
  s3_bucket_policy        = jsonencode({
      Version = "2012-10-17",
      Statement = [
          {
              Sid = "AllowSSLRequestsOnly",
              Effect = "Deny",
              Principal = "*",
              Action = "s3:*",
              Resource = [
                  module.bucket.s3_arn,
                  "${module.bucket.s3_arn}/*"
              ],
              Condition = {
                  Bool = {
                      "aws:SecureTransport": "false"
                  }
              }
          }
      ]
  })
  common_tags             = var.common_tags

  # Bucket public access
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true

  versioning = {
    status = "Enabled"
    mfa_delete = "Disabled"
  }

  cors_rule = {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
  
}