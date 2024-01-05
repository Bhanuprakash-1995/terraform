locals {
  instance_type = var.is_prod ? "t2.medium" : "t2.micro"
}
