module "vpc" {
  source = "../../modules/vpc"

  name                = "inception-cloud-00-prod"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["ap-south-1a", "ap-south-1b"]
}

locals {
  subnets = module.vpc.public_subnet_ids
}

module "ec2" {
  source = "../../modules/ec2"

  for_each = toset(local.subnets)

  instance_name          = "inception-cloud-00-prod-webserver"
  ami_id                 = "ami-0e35ddab05955cf57"
  instance_type          = "t2.micro"
  subnet_id              = each.value
  vpc_security_group_ids = [module.vpc.default_security_group_id]
}
