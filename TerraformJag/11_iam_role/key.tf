resource "aws_key_pair" "jagawsdevops" {
  key_name = "jagawsdevops"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
