terraform {
  required_providers {
    aws = {
        version = "~> 5.2"
        source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = var.region
}

resource "aws_vpc" "tf_vpc" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"

}
