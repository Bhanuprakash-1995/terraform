resource "aws_instance" "roboshop" {
  ami                         = "ami-03265a0778a880afb"
  subnet_id                   = "subnet-01c58aba803ab2bc4"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Roboshop_connection.id]
  tags = {
    Name : "provisionorss"
  }
  # connection {
  #   type     = "ssh"
  #   user     = "centos"
  #   password = "DevOps321"
  #   host     = self.public_ip
  # }
  # provisioner "remote-exec" {
  #   inline = ["echo this is from remote exec > /tmp/sample.txt",
  #     "sudo yum install nginx -y",
  #     "sudo systemctl start nginx"
  #   ]
  # }
}

resource "aws_security_group" "Roboshop_connection" {
  name = "provisioner"
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name : "Roboshop_connection"
  }
}
