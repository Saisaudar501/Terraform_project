data "aws_ami" "myAmi" {
 most_recent = true
 owners = [ "amazon" ]
 filter {
   name = "name"
   values = ["amzn2-ami-hvm-*-gp2"]
 }
 filter {
   name = "root-device-type"
   values = [ "ebs" ]
 }
 filter {
   name = "virtualization-type"
   values = [ "hvm" ]
 }
 filter {
   name = "architecture"
   values = [ "x86_64" ]
 }

}

data "aws_security_group" "mysg1" {
    id = var.aws_sg
}

data "aws_subnet" "subnet" {
 id = var.subnetid
 availability_zone = "us-west-1b"
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.myAmi.id
  instance_type = var.inst_type
  key_name = var.keypair
  subnet_id = data.aws_subnet.subnet.id
  security_groups = [ data.aws_security_group.mysg1.id ]
  tags = {
    Name = "newinstance"
  }
}