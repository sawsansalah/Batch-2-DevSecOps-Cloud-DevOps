variable "vpc_id" {
  description = "ID of the VPC to create subnets in"
  type        = string
}

variable "igw_id" {
  description = "ID of the internet gateway (optional, used for public route)"
  type        = string
  default     = ""
}

variable "az_one" {
  description = "Availability zone for subnets"
  type        = string
}

variable "cidr_pub_subnet" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "cidr_private_subnet" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "subnet_pub_name" {
  type = string
}

variable "subnet_private_name" {
  type = string
}
