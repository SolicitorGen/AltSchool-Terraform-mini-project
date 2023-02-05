# Creating server1
resource "aws_instance" "altschool-server" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = "altschool-terraform-project-key"
  security_groups = [aws_security_group.altschool-ec2-security-grp-rule.id]
  count = length(var.vpc_subnets)
  subnet_id       = aws_subnet.altschool-public-subnet[count.index].id
  availability_zone = aws_subnet.altschool-public-subnet[count.index].availability_zone
}

# resource "aws_instance" "altschool-server1" {
#   ami             = "ami-00874d747dde814fa"
#   instance_type   = "t2.micro"
#   key_name        = "altschool-terraform-project-key"
#   security_groups = [aws_security_group.altschool-ec2-security-grp-rule.id]
#   subnet_id       = aws_subnet.altschool-public-subnet1.id
#   availability_zone = "us-east-1a"
# }

# creating server2
# resource "aws_instance" "altschool-server2" {
#   ami             = "ami-00874d747dde814fa"
#   instance_type   = "t2.micro"
#   key_name        = "altschool-terraform-project-key"
#   security_groups = [aws_security_group.altschool-ec2-security-grp-rule.id]
#   subnet_id       = aws_subnet.altschool-public-subnet2.id
#   availability_zone = "us-east-1b"
# }

# # creating server3
# resource "aws_instance" "altschool-server3" {
#   ami             = "ami-00874d747dde814fa"
#   instance_type   = "t2.micro"
#   key_name        = "altschool-terraform-project-key"
#   security_groups = [aws_security_group.altschool-ec2-security-grp-rule.id]
#   subnet_id       = aws_subnet.altschool-public-subnet3.id
#   availability_zone = "us-east-1c"
# }
