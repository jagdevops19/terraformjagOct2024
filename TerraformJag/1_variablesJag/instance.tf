resource "aws_vpc" "mainjag" {
  cidr_block = "192.0.0.0/16"
}
resource "aws_subnet" "mainjag" {
  vpc_id     = aws_vpc.mainjag.id
  cidr_block = "192.0.1.0/24"
}
resource "aws_instance" "name" {
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.mainjag.id
  tags = {
    Name = "example-jag-instacne"
  }

}