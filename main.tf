/*resource "aws_instance" "count_code_of_meta_argument" {
  #count         = 2
  ami           = "ami-0c30b7300f5fb34cd"
  instance_type = "t3.small"
  subnet_id     = "subnet-02c39a66493664cc1"

  depends_on = [aws_security_group.depends_on_sg]

  tags = {
    Name = "Instance-${count.index + 1}"
               
  }
}

*/

resource "aws_instance" "depends_on_meta_argument" {
  ami           = "ami-0c30b7300f5fb34cd"
  instance_type = "t3.small"
  subnet_id     = "subnet-02c39a66493664cc1"

  depends_on = [aws_security_group.depends_on_sg]

  tags = {
    Name = "Instance-depends_on"
               
  }
}


resource "aws_security_group" "depends_on_sg" {
  name        = "depends_on_security-group"
  description = "depends_on_security-group"

  # Security group rules configuration...
}