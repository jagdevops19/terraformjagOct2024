resource "aws_vpc" "mainjag" {
cidr_block = "192.0.0.0/16"
}
resource "aws_subnet" "mainjag" {
    vpc_id = aws_vpc.mainjag.id
    cidr_block = "192.0.1.0/24"
}


resource "aws_key_pair" "jagawsdevops" {
  key_name = "jagawsdevops"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.jagawsdevops.key_name
  subnet_id = aws_subnet.mainjag.id
 
  provisioner "file" {
    #source = "/Desktop/TerraformJag/2_linux_software_provisioning/script.sh"
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/script.sh",
       "sudo /tmp/script.sh"
     # "chmod +x /tmp/script.sh",
     # "sudo /tmp/script.sh"
    ]
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = var.INSTANCE_USERNAME
    #private_key = file(var.PATH_TO_PRIVATE_KEY)
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  tags = {
  Name = "nginx"
  }
}
 

