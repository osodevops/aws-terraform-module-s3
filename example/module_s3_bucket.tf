module "detected_public_account_bucket" {
  source                  = "../"
  s3_bucket_name          = "exaple_bucket_name"
  s3_bucket_acl           = "private"
  s3_bucket_force_destroy = false
  s3_bucket_policy        = ""
  common_tags             = var.common_tags

  # Bucket public access
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true

  versioning = {
    status = true
    mfa_delete = false
  }

  cors_rule = {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
  
}