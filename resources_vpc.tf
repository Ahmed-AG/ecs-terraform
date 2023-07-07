# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Subnets
resource "aws_subnet" "pub-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.vpc_cidr

#  map_public_ip_on_launch = false
  tags = {
    Name     = "${var.vpc_name}-pub-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name     = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "routetbl-pub" { 
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-pub-routetbl"
  }
}

resource "aws_route" "route-pub" {
  route_table_id         = aws_route_table.routetbl-pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "routetbl-pub" {
  subnet_id      = aws_subnet.pub-subnet.id
  route_table_id = aws_route_table.routetbl-pub.id
}

# Security group 

resource "aws_security_group" "sg_tasks" {
  name        = "sg_tasks"
  description = "Allow inbound traffic to ECS Tasks"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "HTTPS from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow HTTP"
  }
}