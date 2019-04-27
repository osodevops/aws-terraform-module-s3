variable "common_tags" {
  type = "map"
}

variable "s3_bucket_acl" {
  default = "private"
}

variable "s3_bucket_force_destroy" {}
variable "s3_bucket_name" {}
variable "s3_bucket_policy" {}

locals {
  environment = "${substr(var.common_tags["Environment"],0,1)}"
}

variable "bucket_versioning" {
  default = false
}

variable "s3_sse_algorithm" {
  default = "AES256"
}