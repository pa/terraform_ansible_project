terraform {
  backend "s3" {
    bucket = "state-storage-terraform"
    key    = "terraform-state/"
    region = "us-east-1"
  }
}
