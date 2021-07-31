resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-south-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "apache-v2"
    version = 1
  }
}
