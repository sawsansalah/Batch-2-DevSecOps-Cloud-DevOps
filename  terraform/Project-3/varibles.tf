variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
}

variable "az_one" {}
variable "cidr_pub_subnet" {}

variable "cidr_private_subnet" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "vpc_cidr" {}
