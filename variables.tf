variable "common_tags" {
  description = "Set the common tags that will be populated to all AWS resources"
  type        = map(string)
  default = {
    Name = "Oso-Test"
  }
}

variable "s3_bucket_acl" {
  description = "Set the bucket access control list"
  default     = "private"
}

variable "s3_bucket_force_destroy" {
  description = "Allow the bucket to be destroyed after creation"
  default     = false
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

variable "enable_lifecycle" {
  description = "Enable the object lifecycle and store older items in Glacier"
  default     = true
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

