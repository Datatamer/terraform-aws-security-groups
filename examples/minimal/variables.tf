variable "vpc_id" {
}
variable "ingress_ports" {
  default = []
}
variable "sg_name_prefix" {
  default = "terraform-aws-security-groups-example"
}
variable "ingress_cidr_blocks" {
  default = ["1.2.3.4/0"]
}
variable "egress_cidr_blocks" {
  default = ["0.0.0.0/0"]
}
variable "tags" {
  type        = map(string)
  description = "Additional tags for resources created by this example"
  default     = { 
    Author = "Tamr"
    Environment = "Example"
  }
}
