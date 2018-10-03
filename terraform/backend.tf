terraform {
  backend "s3" {
    bucket = "state-storage-terraform"
    key    = "terraform-execution-state/"
    region = "us-east-1"
  }
}
