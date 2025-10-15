📁 terraform-project/
│
├── main.tf
├── variables.tf
└── terraform.tfvars

1️⃣ main.tf
This file contains all AWS resources (VPC → Subnet → IGW → Route Table → Security Group → EC2).

2️⃣variables.tf
Here we define all the variables we used in main.tf.

Step 1: Create an SSH Key Pair in AWS
Option A: Using AWS Console

Go to EC2 → Key Pairs → Create Key Pair.

Name it my-keypair (or your preferred name).

Choose PEM format (for Linux/macOS) or PPK (for Windows with PuTTY).

Download the private key (my-keypair.pem) and keep it safe.

Option B: Using AWS CLI
aws ec2 create-key-pair --key-name my-keypair --query 'KeyMaterial' --output text > my-keypair.pem
chmod 400 my-keypair.pem

Step 2: Reference the Key in Terraform

In your EC2 resource:

resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo.id
  key_name      = var.key_name   # must match your AWS key pair
}

Step 3: Connect to Your EC2 Instance
ssh -i my-keypair.pem ec2-user@<EC2_PUBLIC_IP>


✅ Notes:

The key pair must exist in the same AWS region as your instance.

my-keypair.pem is your private key; never commit it to GitHub.