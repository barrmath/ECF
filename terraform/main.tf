terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "mongo_DB" {
  ami           = "ami-00a4e06732205ac29"
  instance_type = "t2.micro"

  tags = {
    Name = "MongoDB"
  }
}

resource "aws_instance" "spark_cluster" {
  ami           = "ami-00a4e06732205ac29"
  instance_type = "t2.micro"

  tags = {
    Name = "Apache_Spark"
  }
}