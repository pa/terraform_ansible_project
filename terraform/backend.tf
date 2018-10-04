/*
  Configuring Backend for storing terraform execution state in S3
*/
terraform {
  backend "s3" {
    bucket = "state-storage-terraform"
    key    = "terraform-state/"
    region = "us-east-1"
  }
}
