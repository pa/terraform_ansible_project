terraform {
  backend "s3" {
    bucket = "${bucket}"
    key    = "${key}"
    region = "${region}"
  }
}
