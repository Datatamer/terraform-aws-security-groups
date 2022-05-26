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

variable "vpc_cidr" {
    type = string
    default = "172.21.0.0/20"
}

variable "name_prefix" {
  type = string
  default = "terratest-helper"
}

variable "tags" {
    type = map(string)
    default = ({
        "Terratest": "True"
        "Terraform": "True"
        "Environment": "Test"
        "Env": "Test"
    })
}