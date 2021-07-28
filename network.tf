resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }
 
 resource "aws_subent" "main" {
     vpc_id=aws_vpc.main.id
     cidr_block="190.160.1.0/24"
   }  
   
