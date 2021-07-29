resource "aws_vpc" "main" {
   cidr_block="190.160.0.0/16"
 }
 
resource "aws_subnet" "main" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.main.id
  cidr_block        = data.template_file.public_cidrsubnet[count.index].rendered
  availability_zone = slice(data.aws_availability_zones.available.names, 0, var.subnet_count)[count.index]
}
   
