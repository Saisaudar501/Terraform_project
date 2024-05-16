output "ip" {
  value = aws_instance.myec2.public_ip
  description = "print the public ip"
}
output "pvt_ip" {
    value = aws_instance.myec2.private_ip
    sensitive = true
description = "print the pvt ip"
}