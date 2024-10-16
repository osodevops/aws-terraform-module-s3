resource "aws_s3_bucket" "bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = var.s3_bucket_force_destroy

  tags = merge(var.common_tags)

}

resource "aws_s3_bucket_acl" "bucket-acl" {
    count  = var.acl_enabled ? 1 : 0
    bucket = aws_s3_bucket.bucket.id   
    acl    = var.s3_bucket_acl
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "bucket-configuration" {
  count  = var.intelligent_tiering_configuration_enabled ? 1 : 0
  bucket = one(aws_s3_bucket.bucket[*].bucket)
  name   = var.intelligent_tiering_configuration_name 

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = var.deep_archive_access_days
  }
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = var.archieve_access_days
  }
}


resource "aws_s3_bucket_cors_configuration" "bucket" {
    bucket   = aws_s3_bucket.bucket.id    

    cors_rule {
      allowed_headers = lookup(var.cors_rule, "allowed_headers", null)
      allowed_methods = lookup(var.cors_rule, "allowed_methods", null)
      allowed_origins = lookup(var.cors_rule, "allowed_origins", null)
      expose_headers  = lookup(var.cors_rule, "expose_headers", null)
      max_age_seconds = lookup(var.cors_rule, "max_age_seconds", null)
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encrpytion" {
    bucket = aws_s3_bucket.bucket.id    
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.s3_sse_algorithm
      }
    }
}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = one(aws_s3_bucket.bucket[*].bucket)

  versioning_configuration {
    status     = lookup(var.versioning, "status", null)
    mfa_delete = lookup(var.versioning, "mfa_delete", null)
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_policy" "bucket-policy-custom" {
  count  = var.s3_bucket_policy == true ? 1 : 0
  bucket = aws_s3_bucket.bucket.bucket
  policy = var.s3_bucket_policy
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  count = var.s3_bucket_policy == false ? 1 : 0
  bucket = aws_s3_bucket.bucket.bucket
  policy = one(data.aws_iam_policy_document.bucket-tls-policy-document[*].json)
}

data "aws_iam_policy_document" "bucket-tls-policy-document" {
  count = var.tls_enabled ? 1 : 0

  statement {
    sid = "TLSEnabled"

    effect = "Deny"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test = "Bool"
      variable = "aws:SecureTransport"
      values = ["false"]
    }

    condition {
      test = "NumericLessThan"
      variable = "s3:TlsVersion"
      values = [1.2]
    }

    actions = ["*"]

    resources = [
      "${one(aws_s3_bucket.bucket[*].arn)}/*",
      one(aws_s3_bucket.bucket[*].arn),
    ]
  }
}
