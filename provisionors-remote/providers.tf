provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "robo-bucket-bk"
    key            = "pro"
    region         = "us-east-1"
    dynamodb_table = "robo-dynamo"
  }
}
