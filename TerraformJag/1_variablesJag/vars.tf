variable "aws_region" {
  default = "eu-west-2"
}
variable "ami" {
  type = map(string)
  default = {
    "eu-west-2" = "ami-05ea2888c91c97ca7"
  }
}
