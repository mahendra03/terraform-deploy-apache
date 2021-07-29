resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }
 
subnetcidr = {  
  "190.160.0.0/20" = "ap-south-1a"
  "190.160.1.0/20" = "ap-south-1b"
}

resource "aws_subnet" "name" {
  for_each = var.subnetcidr
  vpc_id = aws_vpc.name.id
  availability_zone = each.value
  cidr_block = each.key
}
   
