data "aws_ami" "sample_data_source" {
  owners = ["973714476881"]
  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "aws-linux-2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_security_groups" "example_sg" {
  // Fetching information about all security groups in the selected region
  filter {
    name   = "tag: allow-all" // You can filter by tags or other attributes
    values = ["allow all"]    // Replace with the name of your security group
  }
}
