#output block is used to print the required values

output "aws_instance" {
value = aws_instance.pub_instance.ami  
}
output "aws_instance" {
    value = aws_instance.pub_instance.public_ip 
}
output "aws_instance" {
    value = aws_instance.pub_instance.tags
}
output "aws_vpc" {
    value = aws_vpc.myvpc.tags
}
output "aws_subnet" {
    value = aws_subnet.sub1.id
}