resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.s3_bucket_name}"
  policy        = "${var.s3_bucket_policy}"
  acl           = "${var.s3_bucket_acl}"
  force_destroy = "${var.s3_bucket_force_destroy}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        count = "1"
        sse_algorithm = "AES256"
      }
    }
  }

  tags = "${merge(var.common_tags,
    map("Name", "${local.environment}-${var.s3_bucket_name}-S3")
    )}"
}
