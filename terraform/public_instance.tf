/*
  Web Servers
*/
resource "aws_instance" "web-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "P250917h"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.us-east-1a-public.id}"
    associate_public_ip_address = true
    source_dest_check = true
    iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"

    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

    tags {
        Name = "Web Server 1"
    }
}
