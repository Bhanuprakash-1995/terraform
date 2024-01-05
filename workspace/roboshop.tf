resource "aws_instance" "roboshop" {
  for_each                    = var.instance_names
  ami                         = data.aws_ami.sample_data_source.image_id
  subnet_id                   = var.subnet_id
  instance_type               = each.value
  associate_public_ip_address = true
  tags = {
    Name : each.key
  }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id  = var.zone_id
  name     = each.key
  type     = "A"
  ttl      = 1
  records  = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip]
}
