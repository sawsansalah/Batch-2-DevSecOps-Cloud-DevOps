# ---------- Provider ----------
provider "aws" {
  region = var.region
}

# ---------- VPC ----------
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = var.vpc_name
  }
}

# ---------- Subnet ----------
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_subnet
  map_public_ip_on_launch = true
  availability_zone       = var.az_one

  tags = {
    Name = var.subnet_name
  }
}

# ---------- Internet Gateway ----------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"
  }
}

# ---------- Route Table ----------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route"
  }
}

# ---------- Associate Route Table with Subnet ----------
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ---------- Security Group ----------
resource "aws_security_group" "my_sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }
}

# ---------- EC2 Instance ----------
resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "My-EC2-Instance"
  }
}
