/*
  Database Servers
*/

resource "aws_instance" "db-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "P250917h"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.us-east-1a-private.id}"
    source_dest_check = false

    tags {
        Name = "DB Server 1"
    }
}
