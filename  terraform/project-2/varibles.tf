variable "aws_region" {
  description = "AWS region to deploy"  
  type = string 
}

variable "vpc_cidr" {
    description = "CIDR block"
    type = string
  
}

variable "vpc_name" {
  description = "name of vpc"
  type = string
}

variable "cidr_pub_subnet" {
    description = "cidr subnet"
    type = string
  
}

variable "az_one" {
    description = "avaibility Zone"
    type = string
  
}

variable "cidr_private_subnet" {
  
  description = "name of subnet"
  type = string
}

variable "ami_id" {
    description = "ami id"
    type = string
  
}

variable "instance_type" {
    description = "type of instaance"
    type = string
  

}

variable "key_name" {
    description = "my key"
    type = string
  
}

