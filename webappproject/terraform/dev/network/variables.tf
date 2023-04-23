# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.1.0.0/16"
  type        = string
  description = "VPC to host static website"
}

# Provision public subnets in custom VPC
variable "public_subnet_cidrs" {
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs"
}

# Provision private subnets in custom VPC
variable "private_subnet_cidrs" {
  default     = ["10.1.5.0/24", "10.1.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs"
}

# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Group 2",
    "App"   = "WebApp"
  }
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

# Name prefix to identify resources
variable "prefix" {
  default     = "group2"
  type        = string
  description = "Name prefix"
}