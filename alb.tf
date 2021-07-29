resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webSG.id]
  subnets            = [aws_subnet.main.id]
  

  enable_deletion_protection = true

  access_logs {
    bucket  = "mahendrajson"
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "dev"
  }
}
