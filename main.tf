resource "aws_instance" "myec2" {
  ami = var.ami_id
  instance_type = var.inst
  key_name = var.key

  tags = {
    Name="xyz"
  }
}

resource "aws_s3_bucket" "buck" {
  bucket = "hcasudjcnbcvvsad"
  
}