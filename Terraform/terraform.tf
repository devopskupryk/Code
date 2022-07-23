provider "aws" {
  profile = "default"
  region = "eu-central-1"
}

resource "aws_s3_bucket" "learning_terraform" {
  bucket = "learning-terraform-20220720"
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.learning_terraform.id
  acl    = "private"
}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "eu-central-1a"
  tags = {
    "Terraform" : "true"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = "eu-central-1b"
  tags = {
    "Terraform" : "true"
  }
}

resource "aws_elb" "mytest_web_elb" {
  name            = "mytest-web-elb"
  instances       = aws_instance.mytest_web.*.id
  subnets         = [aws_default_subnet.default_az1.id,aws_default_subnet.default_az2.id]
  security_groups = [aws_security_group.mytest_web_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  tags = {
    "Terraform" : "true"
  }
}

resource "aws_security_group" "mytest_web_sg" {
  name        = "mytest_web_sg"
  description = "Allow standard http and ssh ports inbound and everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["217.23.3.91/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}

resource "aws_instance" "mytest_web" {
  count = 2

  ami           = "ami-22f32d4d"
  instance_type = "t2.nano"
  key_name      = aws_key_pair.mytest_web_key.key_name

  vpc_security_group_ids = [
    aws_security_group.mytest_web_sg.id
  ]

  tags = {
    "Terraform" : "true"
  }
}

resource "aws_key_pair" "mytest_web_key" {
  key_name   = "mytest_web_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1muZ2aUy/7VxOOISojzMH+CZiP6zb4dxWiDTJCU5To+5njIgf22P0F12bE4TykSWVJXKqSw4o/vGYi5Rj8fdYZYY3AMgiqmwD1f7kDjl821i9kAfd3SfV/4n9KIW/SVWC20Uyqg0q5lEbdHgZAzVI1/rNr1Y65IJ/RDK5/a2i0PKB3vSQUG7OTFUlcqsYxRIKE9aZFKZOQRgaLHSR+Vi4/DCTJNuIc+fuKvsHGp9QiNBZ9PI1NZPXKRHdYYsD+6usTHpzNWP4+PT/8G9uDqM9ibAcz7E6/4UIWMYPM17Ev3Rhh68iV3qLX63rkRl4uKO8S9Jp8vJmy7N53b2slaz7EdcAG5V4s/Daq1A23IEkS4aClykFuIL6mV7BetTzyqEUF8LL/atIon+Qd7BWqndT/nDIqGHORkvwY+x2AbNUDjwxcSB+JcS9VOL960QVrO4+5iBUGZUnH7HNdd8YOnlskiBqN1E/dTiBoV7qi/BqC/0XUPX26jPXzSzTzvFbUhc= sergey@TP300LD"
}