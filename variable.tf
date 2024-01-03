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


