#Custom network creation steps:
#Create VPC
#Create Subnet
#Create Internet getway and attach to VPC
#Create Route table and configure with Internet Getway (Edit Routes)
#Subnet association to Route table (Public network)


resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "custom_vpc"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name="Mysubnet"
  }
}

resource "aws_internet_gateway" "ig1" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name="custom_ig1"
    }
  
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
  tags = {
    Name="custom_rt"
  }
}

resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.rt1.id
  
}