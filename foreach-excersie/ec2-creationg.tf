resource "aws_instance" "roboshop" {
  for_each      = var.ec2-instance-map
  ami           = var.ami_id_value
  subnet_id     = var.subnet_id
  instance_type = each.value
  tags = {
    Name : each.key
  }
  associate_public_ip_address = true
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id  = var.zone_id
  name     = each.key
  type     = "A"
  ttl      = 1
  records  = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}
