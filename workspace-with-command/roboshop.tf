resource "aws_instance" "roboshop" {
  ami                         = data.aws_ami.sample_data_source.image_id
  subnet_id                   = var.subnet_id
  instance_type               = lookup(var.instance_type, terraform.workspace)
  associate_public_ip_address = true
  tags = {
    Name : "HelloTerraform"
  }
}
