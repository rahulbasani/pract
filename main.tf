terraform {
  required_providers {
    aws = {
        version = "~> 5.2"
        source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "tf_vpc" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"

}

resource "aws_subnet" "tf_subnet" {
  vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "ap-south-1a"
  cidr_block = "192.168.10.0/24"
}

