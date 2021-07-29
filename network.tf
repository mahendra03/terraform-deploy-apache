resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }
 

resource "aws_subnet" "name" {
  count=2
  vpc_id = aws_vpc.name.id
  cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
}
   
