resource "aws_instance" "roboshop" {
  count         = length(var.instance_name)
  ami           = var.ami_id_value
  subnet_id     = var.subnet_id
  instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql" || var.instance_name[count.index] == "shipping" ? "t3.small" : "t2.micro"
  tags = {
    Name : var.instance_name[count.index]
  }
}

resource "aws_route53_record" "webisite" {
  count   = 11
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instance_name[count.index] == "web" ? aws_instance.roboshop[count.index].public_ip : aws_instance.roboshop[count.index].private_ip]
}


