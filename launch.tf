resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.as_conf.name
  count="${length(var.azs)}"
  vpc_id=aws_vpc.main.id
  cidr_block="${element(var.subnet_cidr,count.index)}"
  min_size             = 1
  max_size             = 1

}
