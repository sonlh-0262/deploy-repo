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
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  tags = {
    Name = var.aws_rt_name 
  }  
}

# Route table association with public subnets
resource "aws_route_table_association" "a" {
  count = length(var.subnets_cidr)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.name.id
}
