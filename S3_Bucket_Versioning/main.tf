#creating a bucket 

resource "aws_s3_bucket" "rmbucket123" {
  bucket = "statefilestore"
}

# creating a resource to enable versioning for bucket

resource "aws_s3_bucket_versioning" "remote_bucket_versioning" {
  bucket = aws_s3_bucket.rmbucket123.id
  versioning_configuration {
    status = "Enabled"
  }
}