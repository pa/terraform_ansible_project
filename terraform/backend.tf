terraform {
  backend "s3" {
    bucket = "state-storage-terraform"
    key    = "terraform-execution-state/myplan.tfplan"
    region = "us-east-1"
  }
}
