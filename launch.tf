resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id = "ami-04db49c0fb2215364" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  key_name = "Mahendra.pem"
  
  security_groups = [ aws_security_group.webSG.id ]

  user_data="${file("httpd.sh")}"

  lifecycle {
    create_before_destroy = true
  }

}

