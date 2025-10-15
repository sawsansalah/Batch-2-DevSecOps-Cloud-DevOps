region        = "us-east-1"

cidr_vpc      = "10.0.0.0/16"
vpc_name      = "my-demo-vpc"

cidr_subnet   = "10.0.1.0/24"
subnet_name   = "my-public-subnet"
az_one        = "us-east-1a"

ami_id        = "ami-0c02fb55956c7d316"   # Amazon Linux 2 AMI (example)
instance_type = "t2.micro"
key_name      = "my-keypair"
