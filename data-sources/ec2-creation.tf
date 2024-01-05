resource "aws_instance" "web" {
  ami           = data.aws_ami.sample_data_source.image_id
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
}
