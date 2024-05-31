resource "aws_instance" "myec2" {
  ami = var.ami_id
  instance_type = var.inst_type
  key_name = var.keypair
  tags = {
    Name="myec2"
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
  depends_on = [ aws_instance.myec2 ]    # adding dependency block in order to create ec2 instance first and the bucket
}

resource "aws_s3_bucket_versioning" "mybucket_versioning" {
    bucket = aws_s3_bucket.mybucket.id
    versioning_configuration {
      status = "Enabled"
    }
}