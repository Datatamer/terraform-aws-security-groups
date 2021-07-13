module "security-groups" {
  source = "../../"

  sg_name_prefix          = var.sg_name_prefix
  ingress_cidr_blocks     = var.ingress_cidr_blocks
  ingress_security_groups = var.ingress_security_groups
  egress_cidr_blocks      = var.egress_cidr_blocks
  egress_security_groups  = var.egress_security_groups
  tags                    = var.tags
  ingress_ports           = var.ingress_ports
  ingress_protocol        = var.ingress_protocol
  egress_protocol         = var.egress_protocol

  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.1.0"

  name = "${var.sg_name_prefix}-vpc"
  cidr = "172.21.0.0/20"

  azs             = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}b"]
  private_subnets = ["172.21.1.0/24", "172.21.2.0/24"]
  public_subnets  = ["172.21.3.0/24", "172.21.4.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = false

  tags = {
    Terraform   = "true"
    Terratest   = "true"
    Environment = "dev"
  }
}

data "aws_region" "current" {}
