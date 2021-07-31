resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "i-0c107582381e57b4e"
  instance_type = "t2.micro"
}
