resource "aws_instance" "roboshop" {
  count                  = 11
  ami                    = var.ami_id_value
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  instance_type          = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql" || var.instance_name[count.index] == "shipping" ? "t3.small" : "t2.micro"
  tags = {
    Name : var.instance_name[count.index]
  }
  associate_public_ip_address = true
}

resource "aws_security_group" "web-sg" { #this is terraform name, for terraform reference only
  name        = var.sg-name              # this is for AWS
  description = var.sg-description
  #vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow All ports"
    from_port   = var.inbound-from-port # 0 means all ports
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_route53_record" "www" {
  count   = 11
  zone_id = var.zone_id
  name    = var.instance_name[count.index]
  type    = "A"
  ttl     = 1
  records = [var.instance_name[count.index] == "web" ? aws_instance.roboshop[count.index].public_ip : aws_instance.roboshop[count.index].private_ip]
}


