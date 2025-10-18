resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = var.vpc_sg_id != "" ? [var.vpc_sg_id] : []

  tags = {
    Name = "ec2-from-module"
  }
}

output "instance_id" {
  value = aws_instance.this.id
}
