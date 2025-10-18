resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_pub_subnet
  map_public_ip_on_launch = true
  availability_zone       = var.az_one

  tags = {
    Name = var.subnet_pub_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_private_subnet
  availability_zone = var.az_one

  tags = {
    Name = var.subnet_private_name
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.subnet_pub_name
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.subnet_private_name
  }
}

resource "aws_route_table_association" "public_assos" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_assos" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
