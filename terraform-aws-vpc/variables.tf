variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "common_tags" {
  type    = map(any)
  default = {}
}

variable "vpc_tags" {
  type    = map(any)
  default = {}
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "igw_tags" {
  type = map(any)
  default = {

  }
}
variable "public_subnets_cidr" {
  type = list(any)
  validation {
    condition     = length(var.public_subnets_cidr) == 2
    error_message = "Please give me the 2 valid subnet"
  }
}

variable "public_subnets_tags" {
  default = {}
}

variable "private_subnets_cidr" {
  type = list(any)
  validation {
    condition     = length(var.private_subnets_cidr) == 2
    error_message = "Please give me the 2 valid subnet"
  }
}

variable "private_subnets_tags" {
  default = {}
}

variable "database_subnets_cidr" {
  type = list(any)
  validation {
    condition     = length(var.database_subnets_cidr) == 2
    error_message = "Please give me the 2 valid subnet"
  }
}

variable "database_subnets_tags" {
  default = {}
}
