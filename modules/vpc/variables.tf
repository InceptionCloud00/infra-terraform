variable "name" {
  type        = string
  description = "Base name for resources (prefix)."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets."
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for subnets."
}
