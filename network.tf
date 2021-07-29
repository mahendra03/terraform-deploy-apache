resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }
 
variable "subnetcidr" {  
  one="190.160.0.0/20" 
  two="190.160.1.0/20"
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  cidr_block = var.subnetcidr
}
   
