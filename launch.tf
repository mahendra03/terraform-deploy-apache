data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "ami-04db49c0fb2215364"
    values = ["amzn2-ami-hvm-2.0.20210721.2-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["755555152992"] # Canonical
}

resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}
