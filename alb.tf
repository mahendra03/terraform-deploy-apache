resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  vpc_security_group_ids=["${aws_security_group.webSG.id}"]
  subnets            = "190.160.1.0/24"

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
