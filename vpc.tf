terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile    = "default"
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source = "/pexiep/10.08.2021"

  vpc_name = "hiep vpc"
  name = var.vpc_name
  cidr = var.vpc_cidr

  azs                               = var.vpc_azs
  private_subnets                   = var.vpc_private_subnets
  public_subnets                    = var.vpc_public_subnets
  database_subnets                  = var.vpc_db_subnets
  enable_nat_gateway                = var.vpc_enable_nat_gateway
  create_igw                        = var.create_igw
  default_route_table_routes        = var.default_route_table_routes
  default_security_group_name       = var.default_security_group_name
  default_security_group_egress     = var.default_security_group_egress
  default_security_group_ingress    = var.default_security_group_ingress
  tags = var.vpc_tags
}


