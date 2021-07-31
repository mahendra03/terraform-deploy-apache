resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webSG.id]
  subnets            = ["subnet-00bce002b4aa75e43", "subnet-01cb9e926e6c799f3"]
  

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
