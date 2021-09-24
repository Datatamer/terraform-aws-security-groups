module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.1.0"

  name = "${var.name_prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}b"]
  # private_subnets = ["172.21.1.0/24", "172.21.2.0/24"]
  # public_subnets  = ["172.21.3.0/24", "172.21.4.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = false

  tags = var.tags
}

data "aws_region" "current" {}
