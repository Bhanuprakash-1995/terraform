resource "aws_instance" "roboshop" {
  ami           = var.ami_id_value
  instance_type = local.instance_type
  tags = {
    Name : "locals"
  }
}

