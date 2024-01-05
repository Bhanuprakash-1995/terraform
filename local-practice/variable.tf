variable "ami_id_value" {
  default = "ami-03265a0778a880afb"
}
variable "region_value" {
  default = "us-east-1"
}
variable "instance_type_value" {
  type    = string
  default = "t2.micro"
}
variable "instance_name" {
  type    = list(string)
  default = ["mongodb", "web", "catalogue", "redis", "user", "cart", "mysql", "shipping", "rabbitmq", "payment", "dispatch"]
}
variable "zone_id" {
  default = "Z0069445QUE862M2UD65"
}
variable "domain_name" {
  default = "roboshopapp.webiste"
}
variable "subnet_id" {
  default = "subnet-01c58aba803ab2bc4"
}

variable "sg-name" {
  type    = string
  default = "roboshop-all-aws"
}

variable "sg-description" {
  type    = string
  default = "Allow TLS inbound traffic"
}

variable "inbound-from-port" {
  #type = string
  default = 0
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "is_prod" {
  type    = bool
  default = false
}
