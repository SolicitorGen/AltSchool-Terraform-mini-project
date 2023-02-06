# Creating VPC
resource "aws_vpc" "altschool_vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
}

# Creating Internet Gateway
resource "aws_internet_gateway" "altschool_internet_gateway" {
  vpc_id = aws_vpc.altschool_vpc.id
}

#Creating Route Table
resource "aws_route_table" "altschool-route-table-public" {
  vpc_id = aws_vpc.altschool_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.altschool_internet_gateway.id
  }
}

# Creating Subnets
resource "aws_subnet" "altschool-public-subnet" {
  vpc_id                  = aws_vpc.altschool_vpc.id
  count = length(var.vpc_subnets)
  cidr_block              = var.vpc_subnets[count.index].subnet
  map_public_ip_on_launch = true
  availability_zone       = var.vpc_subnets[count.index].availability_zone
}

# Associating route table with subnets
resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.vpc_subnets)
 subnet_id      = element(aws_subnet.altschool-public-subnet[*].id, count.index)
 route_table_id = aws_route_table.altschool-route-table-public.id
}

# Creating Network ACL
resource "aws_network_acl" "altschool-network_acl" {
  vpc_id     = aws_vpc.altschool_vpc.id
  subnet_ids = aws_subnet.altschool-public-subnet.*.id
  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

