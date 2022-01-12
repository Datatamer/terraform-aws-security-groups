module "security-groups" {
  source = "../../examples/minimal"

  sg_name_prefix       = var.sg_name_prefix
  ingress_cidr_blocks  = var.ingress_cidr_blocks
  egress_cidr_blocks   = var.egress_cidr_blocks
  ingress_ports        = var.ingress_ports
  vpc_id               = var.vpc_id
}
