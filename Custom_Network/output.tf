#output block is used to print the required values

output "instance_ami" {
value = aws_instance.pub_instance.ami  
}
output "aws_instance_public_ip" {
value = aws_instance.pub_instance.public_ip 
}
output "aws_instance_tag" {
value = aws_instance.pub_instance.id
}
output "aws_vpc_tag" {
value = aws_vpc.myvpc.id
}
output "aws_subnet_tag" {
value = aws_subnet.sub1.id
}