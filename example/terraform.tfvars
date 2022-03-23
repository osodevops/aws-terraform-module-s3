region                                = "eu-west-2"
environment                           = "prod"

common_tags = {
  Environment                         = "PROD"
  CostCode                            = "S3"
  TF_State                            = "s3_bucket"
  Tool                                = "Terraform"
}