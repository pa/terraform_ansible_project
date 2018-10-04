terraform {
  backend "s3" {
    bucket = "state-storage-terraform"
    key    = "terraform-execution-state/terraform_test.tfstate"
    region = "us-east-1"
  }
}
