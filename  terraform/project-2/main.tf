#####provider#######
provider "aws" {

  region = var.aws_region
}

#########VPC #########
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr


  tags = {
    Name = var.vpc_name
  }
}

#######SUBNET#######
####public#####
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.cidr_pub_subnet
  map_public_ip_on_launch = true
  availability_zone       = var.az_one


  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}
######private-subnet######
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.cidr_private_subnet
  availability_zone       = var.az_one


  tags = {
    Name = "${var.vpc_name}-public-subnet"

  }
}


#######IG#######
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-igw"
  }
}
#######Route Table#########
####PUBLIC route######
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "${var.vpc_name}-public-route"
  }
}

#######private_roure##### NO internet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "${var.vpc_name}-private-route"
  }
}


####Route table assisoate -public  ####
resource "aws_route_table_association" "public_assos" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
####Route table assisoate -private  ####
resource "aws_route_table_association" "private_assos" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
#####Secuirt_group-public#####
resource "aws_security_group" "public_sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.my-vpc.id

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
    Name = "public-sg"
  }
}

#####Secuirt_group-private#####
resource "aws_security_group" "private_sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}

########EC2 INSTANCE -public ########
resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "my_EC2"
  }


}

########EC2 INSTANCE -private ########
resource "aws_instance" "db" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = var.key_name
  tags = {
    Name = "DB"
  }


}
