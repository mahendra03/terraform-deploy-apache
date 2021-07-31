resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "web" {
  name = "${aws_launch_configuration.as_conf.name}-asg"

  min_size             = 1
  desired_capacity     = 1
  max_size             = 1
  
  launch_configuration = aws_launch_configuration.as_conf.name

  vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]

}
