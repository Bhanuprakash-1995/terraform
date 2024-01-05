provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

variable "subnets_cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# variable "subnets_availablity_zone" {
#   description = "Subnets subnets_availablity_zone"
#   type        = list(string)
#   default     = ["us-east-1a", "us-east-1b"]
# }

resource "aws_subnet" "name" {
  count             = length(var.subnets_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets_cidr_blocks[count.index]
  availability_zone = "us-east-1a"
}


output "first_id" {
  description = "The id for the first subnet"
  value       = aws_subnet.name[0].id
}

output "all_ids" {
  description = "The id for the first subnet"
  value       = aws_subnet.name[*].id
}
