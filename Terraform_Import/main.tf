resource "aws_instance" "imported_instance" {
  ami = "ami-02bf8ce06a8ed6092"
  instance_type = "t2.micro"
  tags = {
    Name ="renaming"
  }
}
