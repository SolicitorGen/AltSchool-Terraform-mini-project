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

