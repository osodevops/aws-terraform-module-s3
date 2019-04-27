output "s3_id" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "s3_arn" {
  value = "${aws_s3_bucket.bucket.arn}"
}