/*
  Configuring Backend for storing terraform execution state in S3
*/
terraform {
  backend "s3" {
    bucket = "state-storage-terraform"
    key    = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
}
