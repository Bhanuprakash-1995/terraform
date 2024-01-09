resource "aws_instance" "roboshop" {
  ami                         = data.aws_ami.sample_data_source.image_id
  subnet_id                   = "subnet-01c58aba803ab2bc4"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow-all-connection.id]
  tags = {
    Name : "provisionors"
  }
  provisioner "local-exec" {
    command = "echo the server ip adress ${self.private_ip}"
  }
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = ["echo this is from remote exec > /tmp/sample.txt",
      "sudo yum install nginx -y",
    "sudo systemctl start nginx"]
  }
}

resource "aws_security_group" "allow-all-connection" {
  name = "provisioner"
  ingress {
    description = "allow all ports"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name : "allow-all-connections"
  }
}
