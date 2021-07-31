resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0a5ccbe0d74bc609c"]
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
