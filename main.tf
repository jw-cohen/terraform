variable "instance_size" {
  type = string
  description = "The EC2 Instance Size To Create"
}

variable "instance_name" {
  type = string
  description = "User friendly displayname of the EC2"
}

terraform {
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
  region  = "us-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-075ed77f64c9a6221"
  instance_type = var.instance_size

  tags = {
    Name = var.instance_name
  }
}