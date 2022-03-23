variable "region" {
  description = "The region to deploy the resources."
  type = string
}

variable "common_tags" {
  description = "List of common tags for current and future reference."
  type = map(string)
}

variable "environment" {
  description = "The environment."
  type = string
}

variable "s3_sse_algorithm" {
  description = "The type of sse algorithm to use."
  default = "aws:kms"
}