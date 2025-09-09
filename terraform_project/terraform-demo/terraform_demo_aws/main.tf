terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  
    }
  }
  required_version = ">= 1.0.0"  
}

provider "aws" {
  region = "ap-southeast-1"
}

# Ambil Key Pair existing (yang sudah ada)
data "aws_key_pair" "my_key" {
  key_name = "onlyone" 
}

# Buat EC2 instance
resource "aws_instance" "demo_ec2" {
  ami           = "ami-0a2fc2446ff3412c3" 
  instance_type = "t3.micro"
  key_name      = data.aws_key_pair.my_key.key_name

  tags = {
    Name = "TerraformDemoEC2"
  }
}