provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "roboshopapp-bucket"
    key            = "provisionors"
    region         = "us-east-1"
    dynamodb_table = "roboshopapp-lock"
  }
}
