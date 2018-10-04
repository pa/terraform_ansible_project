/*
  Creating IAM role for EC2 instance
*/
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

/*
  Creating the IAM policy document for the role
*/
data "aws_iam_policy_document" "ec2_policy" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}

/*
  Creating IAM EC2 policy
*/
resource "aws_iam_policy" "ec2_policy" {
  name   = "ec2_policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.ec2_policy.json}"
}

/*
  Attaching policy to the Role
*/
resource "aws_iam_policy_attachment" "ec2_policy-attach" {
  name       = "ec2_policy-attach"
  roles      = ["${aws_iam_role.ec2_role.name}"]
  policy_arn = "${aws_iam_policy.ec2_policy.arn}"
}

/*
  Creating IAM Instace Profile to attach this role to the EC2 instance
*/
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.ec2_role.name}"
}
