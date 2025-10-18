#####provider#######
provider "aws" {

  region = var.aws_region
}

#VPC MODULE
module "vpc" {

  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = "demo-vpc"

}
// Create the IGW (depends on VPC)
module "igw" {
  source = "./modules/IGW"
  vpc_id = module.vpc.vpc_id
}

// subnet Module (public + private)
module "subnet-public" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.igw.igw_id
  az_one              = var.az_one
  subnet_pub_name     = "public-demo-subnet"
  cidr_pub_subnet     = var.cidr_pub_subnet
  cidr_private_subnet = var.cidr_private_subnet
  subnet_private_name = "private-demo-subnety"
}

module "private-public" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.igw.igw_id
  az_one              = var.az_one
  subnet_pub_name     = "public-demo-subnet"
  cidr_pub_subnet     = var.cidr_pub_subnet
  cidr_private_subnet = var.cidr_private_subnet
  subnet_private_name = "private-demo-subnety"
}
###
module "sg" {
  source = "./modules/secuirty"
  vpc_id = module.vpc.vpc_id
}
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.subnet-public.public_subnet_id
  vpc_sg_id     = module.sg.sg_id


}