# Instance type
variable "instance_type" {
  default = {
    "prod" = "t2.micro"
    "dev"  = "t3.small"
  }
  description = "Type of the instance"
  type        = map(string)
}

# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Group 2"
    "App"   = "WebApp"
  }
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

# Prefix to identify resources
variable "prefix" {
  default     = "group2"
  type        = string
  description = "Name prefix"
}

# Variable to signal the current environment 
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}
