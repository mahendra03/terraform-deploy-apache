resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }
 
resource "aws_subnet" "main"{
   vpc_id=aws_vpc.main.id
   cidr_block=["190.160.1.0/20","190.160.2.0/20"]
}
   
