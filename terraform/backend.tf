terraform {
  backend "s3" {
    bucket = "${var.aws_buckek_name}"
    key    = "${var.aws_key_path}"
    region = "${var.aws_region}"
  }
}
