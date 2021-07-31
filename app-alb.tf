resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}


resource "aws_s3_bucket" "elb_logs" {
  bucket = "se-elb"
  acl    = "private"

  policy = <<POLICY
{
   "Id": "Policy",
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
  POLICY
}
