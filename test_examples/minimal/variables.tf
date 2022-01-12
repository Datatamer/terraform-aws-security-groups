variable "sg_name_prefix" {
  type = string
}

variable "ingress_ports" {
  type = list(string)
}

variable "ingress_cidr_blocks" {
  type = list(string)
}

variable "egress_cidr_blocks" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
