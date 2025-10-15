# AWS Region
variable "region" {
  description = "AWS region to deploy"
  type        = string
}

# VPC
variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# Subnet
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "az_one" {
  description = "Availability Zone for the subnet"
  type        = string
}

# EC2
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Existing AWS key pair name"
  type        = string
}
