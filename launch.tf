resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
}
