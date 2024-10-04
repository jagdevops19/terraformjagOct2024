# Below resource will provision 
resource "aws_instance" "example" {
  #ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  ami           = lookup(var.AMI, var.AWS_REGION_Jag)
  instance_type = "t2.micro"

  # the VPC subnet
  #subnet_id = "${aws_subnet.main-public-1.id}"
  subnet_id = aws_subnet.main-public-1-jag.id
  # the security group
  #vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  # the public SSH key
  #key_name = "${aws_key_pair.jagawsdevops.key_name}"
  #ssh-keygen -t rsa -b 4096 (RUN THIS FIRST)
  key_name = aws_key_pair.jagawsdevops.key_name
}
