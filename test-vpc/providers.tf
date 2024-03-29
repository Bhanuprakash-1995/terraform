terraform {
  backend "s3" {
    bucket         = "robo-bucket-bk"
    key            = "terraform-test-vpc"
    region         = "us-east-1"
    dynamodb_table = "roboshopapp-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}
