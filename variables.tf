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

variable "mfa_delete_enabled" {
  default = false
}

variable "enable_lifecycle" {
  default = true
}

variable "current_ia_transition_days" {
  default = 30
}

variable "current_glacier_transition_days" {
  default = 60
}

variable "noncurrent_ia_transition_days" {
  default = 30
}

variable "noncurrent_glacier_transition_days" {
  default = 60
}

variable "delete_expired_objects" {
  default = false
}

variable "current_version_expiration_days" {
  default = 90
}

variable "block_public_acls" {
  default = false
}

variable "block_public_policy" {
  default = false
}

variable "ignore_public_acls" {
  default = false
}

variable "restrict_public_buckets" {
  default = false
}