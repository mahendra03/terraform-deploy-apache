resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }

variable "sub'{
  default=[
    a="190.160.1.0/24",
    b="190.16021.0/24"
    ]
 
 resource "aws_subnet" "main" {
     vpc_id=aws_vpc.main.id
     for_each=var.sub
     cidr_block=each.value
   }  
   
