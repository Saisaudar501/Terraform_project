provider "aws" {
  region = "us-west-1"
}
resource "aws_instance" "ins_first" {
  ami           = var.ami_id 
  instance_type = var.inst_type
  key_name = var.keypair
  availability_zone = "us-west-1c"
  tags = {
    Name = "Instance"
  }

  # lifecycle {
  # prevent_destroy = true   # prevent the deletion of the resource
  # }

  # lifecycle {
  # ignore_changes = [ tags ]  # ignores the changes made in tag here
  # }
   
   #lifecycle {
    # create_before_destroy = true  # creates the new modified resource before destroying the existing one to ensure high availability
   #}

}