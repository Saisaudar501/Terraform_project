output "aws_instance_public_ip" {
  value= aws_instance.myec2.public_ip
}
output "ami_id" {
    value = aws_instance.myec2.ami
}
output "aws_s3_bucket" {
  value = aws_s3_bucket.mybucket.arn
}