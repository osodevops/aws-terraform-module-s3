variable "common_tags" {
  description = "Set the common tags that will be populated to all AWS resources"
  type = map(string)
}

variable "s3_bucket_acl" {
  description = "Set the bucket access control list"
  default = "private"
}

variable "s3_bucket_force_destroy" {
  description = "Allow the bucket to be destroyed after creation"
  default = false
}

variable "s3_bucket_name" {
  description = "Set the name for the S3 bucket"
}

variable "s3_bucket_policy" {
  description = "You can provide a custom bucket policy with this variable"
}

variable "bucket_versioning" {
  description = "Set if the bucket objects should be versioned or not"
  default     = false
}

variable "s3_sse_algorithm" {
  description = "Set the server side encryption on the bucket, choose between AES or KMS"
  default     = "AES256"
}

variable "mfa_delete_enabled" {
  description = "Require MFA to delete objects"
  default     = false
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

variable "cors_rule" {
  description = "cors rule"
  default     = []
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = {}
}

variable "intelligent_tiering_configuration_enabled {
  description = "If intelligent tiering should be enabled or not."
  type        = bool
  default     = false
}

variable "deep_archive_access_days" {
  type    = number
  default = 180
}

variable "archieve_access_days" {
  type    = number
  default = 125
}

variable "tls_enabled" {
  type    = bool
  default = true
}