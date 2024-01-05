variable "zone_id" {
  default = "Z0069445QUE862M2UD65"
}
variable "domain_name" {
  default = "roboshopapp.webiste"
}
variable "subnet_id" {
  default = "subnet-01c58aba803ab2bc4"
}

variable "instance_type" {
  default = {
    dev  = "t3.medium"
    prod = "t2.micro"
  }
}
