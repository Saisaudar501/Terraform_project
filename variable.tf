variable "ami_id" {
    description = "used for taking ami as a variable"
    type = string
    default = ""
}
variable "inst" {
    description = "using for giving type of instance"
    type = string
    default = ""
}
variable "key" {
    description = "used to store keypair value"
    type = string
    default = ""
}