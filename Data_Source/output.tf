output "instance_ami_id" {
  value = aws_instance.myec2.ami
}
output "sg_name" {
  value = var.aws_sg
}
output "vpcid" {
  value = data.aws_security_group.mysg1.vpc_id
}
