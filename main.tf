resource "aws_instance" "count_code_of_meta_argument" {
  count         = 2
  ami           = "ami-0c30b7300f5fb34c"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-${count.index + 1}"
               
  }
}
