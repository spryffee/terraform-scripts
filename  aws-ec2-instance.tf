# We are pointing "aws" as our provider.

provider "aws" {
    region = "ap-southeast-1"
    access_key = "<access-key-from-aws-user>"
    secret_key = "<secret-key-from-aws-user>"
}

resource "aws_instance" "ec2" { # "ec2" is just a name
  ami = "ami-0dad20bd1b9c8c004" # Image: Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro" # VM Spec
  security_groups = ["${aws_security_group.allow_ports.name}"]
  key_name = "aws-spryffee"
}

resource "aws_security_group" "allow_ports" {
  name        = "allow ports"
  description = "allow port 22 for ssh and port 8888 for netcat"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

output "showPublicIP" { # display the public IP address.
  value = "${aws_instance.ec2.*.public_dns}"
}