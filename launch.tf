
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210430"]
   
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["755555152992"] # Canonical
}

resource "aws_launch_configuration" "as_conf" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 1
  max_size             = 1

  lifecycle {
    create_before_destroy = true
  }
}
