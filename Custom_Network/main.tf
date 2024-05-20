#Custom network creation steps:
#Create VPC
#Create Subnet
#Create Internet getway and attach to VPC
#Create Route table and configure with Internet Getway (Edit Routes)
#Subnet association to Route table (Public network)



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

#Creating security group

resource "aws_security_group" "sg" {
  name        = "my_sg"
  description = "allow inbound and outbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  tags = {
    Name = "my_sg1"
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# creating EC2 instance
resource "aws_instance" "pub_instance" {
  ami           = var.ami_id
  instance_type = var.inst_type
  key_name      = var.keypair
  tags = {
    Name = "myec2"
  }
  subnet_id              = aws_subnet.sub1.id
  vpc_security_group_ids = [aws_security_group.sg.id]    #attaching a security group to instance

}