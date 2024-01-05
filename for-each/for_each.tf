provider "aws" {
  region = "us-east-1"
}

variable "vpcs" {
  type = map(object({
    cidr    = string
    tags    = map(string)
    tenancy = string
  }))
  default = {
    "one" = {
      cidr = "10.0.0.0/16"
      tags = {
        "Name" = "vpc-one"
      }
      tenancy = "default"
    }
    "two" = {
      cidr = "10.20.0.0/16"
      tags = {
        "Name" = "vpc-two"
      }
      tenancy = "default"
    }
  }
}

resource "aws_vpc" "vpc-creation" {
  for_each         = var.vpcs
  cidr_block       = each.value["cidr"]
  tags             = each.value["tags"]
  instance_tenancy = each.value["tenancy"]
}
