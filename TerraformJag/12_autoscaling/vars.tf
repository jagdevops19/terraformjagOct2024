variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "/Users/m/.ssh/jagawsdevops.pem"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "/Users/m/.ssh/jagawsdevops.pub"
}
variable "AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    #us-west-2 = "ami-06b94666"
    eu-west-2 = "ami-05ea2888c91c97ca7" # EU London (using default region)
    eu-west-1 = "ami-844e0bf7"
  }
}
