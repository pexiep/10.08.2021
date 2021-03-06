# Input variable definitions

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "non-prod"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.1.10.0/24", "10.1.11.0/24", "10.1.22.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
}

variable "vpc_db_subnets" {
  description = "Database subnets for VPC"
  type        = list(string)
  default     = ["10.1.100.0/24", "10.1.110.0/24", "10.1.220.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
  default     = true
}

variable "default_route_table_routes" {
  description = "Configuration block of routes."
  type        = list(map(string))
  default = [
    {
      cidr_blocks = "0.0.0.0/0"
    }
    ]
}

variable "default_security_group_name" {
  description = "Name to be used on the default security group"
  type        = string
  default     = "default"
}

variable "default_security_group_egress" {
  description = "List of maps of egress rules to set on the default security group"
  type        = list(map(string))
  default = [
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all"
      from_port   = 0
      protocol    = "-1"
      self        = false
      to_port     = 0
    }
    ]
}

variable "default_security_group_ingress" {
  description = "List of maps of ingress rules to set on the default security group"
  type        = list(map(string))
  default = [
    {
      cidr_blocks = "10.1.0.0/16"
      description = "Allow all from the local network."
      from_port   = 0
      protocol    = "-1"
      self        = false
      to_port     = 0
    },
    {
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all SSH from the internet."
      from_port   = 22
      protocol    = "6"
      self        = false
      to_port     = 22
    },
  ]
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "access_key" {
     description = "Access key to AWS console"
}

variable "secret_key" {
     description = "Secret key to AWS console"
}

variable "key_name" {
  description = "Key Pairs."
}
