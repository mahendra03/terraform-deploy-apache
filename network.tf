resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }

variable "subnet_cidr"{
   type=list
   default=["190.160.1.0/24","190.160.2.0/24"]
   }

variable "azs"{
   type=list
   default=["ap-south-1a","ap-south-1b"]
}

resource "aws_subnet" "main" {
    count="${length(var.azs)}"
    vpc_id=aws_vpc.main.id
    cidr_block="${element(var.subnet_cidr,count.index)}"
}
   
