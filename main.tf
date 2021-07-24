terraform {
  backend "remote" {
    organization = "tsd"
    workspaces {
      name = "iac-test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b29b6e62f2343b46"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
