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

/*resource "aws_instance" "depends_on_meta_argument" {
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
*/

locals {
 vms = {
   "vm1" = { instance_type = "t3.micro", ami_id = "ami-0c30b7300f5fb34cd", name = "My-EC2-1"},
   "vm2" = { instance_type = "t3.small", ami_id = "ami-0c30b7300f5fb34cd", name = "My-EC2-2" },
  # "vm3" = { instance_type = "t3.medium", ami_id = "ami-0c30b7300f5fb34cd", name = "My-EC2-3"}
 }
} 

resource "aws_instance" "my_ec2_for_each_loop" {
 for_each = local.vms
 instance_type = each.value.instance_type
 ami = each.value.ami_id

 tags = merge(var.tag_values, {
    Name = "Instance-${each.value.name}"
  })

}


variable "tag_values" { 
   description = "Map of tags to assign to the resources"
   type  = map(string)
   default  = {
   Environment = "Development"
   Team  = "DevOps"
   batch = "26"
   Class = "Young minds"
  }
}