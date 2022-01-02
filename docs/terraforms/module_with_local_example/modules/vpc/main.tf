# VPC
resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.aws_vpc_name 
  }  
}

# Subnets: public
resource "aws_subnet" "public" {
  count = length(var.subnets_cidr)
  vpc_id = aws_vpc.name.id
  cird_block = element(var.subnets_cird, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Demo-Subnet-${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = var.aws_igw_name 
  }  
}

# Route table: attach Internet Gateway
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  ....
}
