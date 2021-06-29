

module "security-groups" {
  source         = "../../"
  ingress_ports  = var.ingress_ports
  sg_name_prefix = var.sg_name_prefix
  vpc_id         = var.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_cidr_blocks  = var.egress_cidr_blocks
  egress_protocol     = "all"
  ingress_protocol    = "tcp"
}
