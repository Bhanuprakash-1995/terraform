variable "zone_id" {
  default = "Z0069445QUE862M2UD65"
}
variable "domain_name" {
  default = "roboshopapp.webiste"
}
variable "subnet_id" {
  default = "subnet-01c58aba803ab2bc4"
}
variable "instance_names" {
  type = map(any)
  default = {
    # "mongodb"   = "t2.medium"
    # "catalague" = "t2.micro"
    # "web"       = "t2.micro"
  }
}
