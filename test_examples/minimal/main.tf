module "security-groups" {
  source = "../../examples/minimal"

  sg_name_prefix       = var.sg_name_prefix
  ingress_cidr_blocks  = var.ingress_cidr_blocks
  egress_cidr_blocks   = var.egress_cidr_blocks
  ingress_ports        = var.ingress_ports
  vpc_id               = module.vpc.vpc_id
}

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
