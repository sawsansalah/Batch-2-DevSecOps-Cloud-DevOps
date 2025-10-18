variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "vpc_sg_id" {
  type = string
  default = ""
}
