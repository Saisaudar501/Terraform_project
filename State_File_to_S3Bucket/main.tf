#creating VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "custom_vpc"
  }
}

#creating subnet
resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "Mysubnet"
  }
}

#creating Internet gateway
resource "aws_internet_gateway" "ig1" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "custom_ig1"
  }

}

#creating Route table and attaching it to Internet gateway
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }
  tags = {
    Name = "custom_rt"
  }
}

#Subnet association for route table
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt1.id

}


# creating EC2 instance
resource "aws_instance" "pub_instance" {
  ami           = var.ami_id
  instance_type = var.inst_type
  key_name      = var.keypair
  tags = {
    Name = "myec2"
  }
  subnet_id= aws_subnet.sub1.id
}

# creating this block to store state file in s3 bucket
terraform {
  backend "s3" {
    bucket = "statefilestore"   # storing the file in the statefilestore bucket
    key    = "StateFile/terraform.tfstate"   # In the bucket inside the StateFile folder storing the state file
    region = "us-east-1"          # Region of the bucket
  }
}