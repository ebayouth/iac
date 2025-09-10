terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
    required_version = ">= 1.0.0"
}

resource "aws_instance" "ec2-sample" {
    count           = 2
    ami             = "ami-0a2fc2446ff3412c3"
    instance_type   = "t3.micro"

    tags = {
        Name = "EC2-Sample-${count.index + 1}"
    }
}