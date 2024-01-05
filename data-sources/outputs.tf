output "sample" {
  value = data.aws_ami.sample_data_source.image_id
}
output "sample2" {
  value = data.aws_ami.aws-linux-2.image_id
}

output "default_vpc" {
  value = data.aws_vpc.default_vpc
}
