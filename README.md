# Security Groups Module
This module creates security groups.

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "aws-sg" {
  source = "git::https://github.com/Datatamer/terraform-aws-security-groups.git?ref=x.y.z"
  vpc_id = "vpc-123456789"
  ingress_cidr_blocks = [
    "1.2.3.4/32"
  ]
  egress_cidr_blocks  = [
    "0.0.0.0/0"
  ]
  ingress_ports = [8080, 9090]
  ingress_protocol = "tcp"
  egress_protocol = "all"
  sg_name_prefix = "security-group-example"
}
```

# Resources Created
This module creates:
* security groups for ingress
* security groups for egress
* security group rules

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.36.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.36.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress\_protocol | Protocol for egress rules. If not icmp, icmpv6, tcp, udp, or all use the protocol number. | `string` | n/a | yes |
| ingress\_ports | Ports to create ingress traffic rules for | `list(number)` | n/a | yes |
| ingress\_protocol | Protocol for ingress rules. If not icmp, icmpv6, tcp, udp, or all use the protocol number. | `string` | n/a | yes |
| sg\_name\_prefix | Prefix for security group names | `string` | n/a | yes |
| vpc\_id | The ID of the VPC in which to attach the security group | `string` | n/a | yes |
| egress\_cidr\_blocks | CIDR blocks to attach to security groups for egress | `list(string)` | `[]` | no |
| egress\_security\_groups | Existing security groups to attach to new security groups for egress | `list(string)` | `[]` | no |
| ingress\_cidr\_blocks | CIDR blocks to attach to security groups for ingress | `list(string)` | `[]` | no |
| ingress\_security\_groups | Existing security groups to attach to new security groups for ingress | `list(string)` | `[]` | no |
| maximum\_rules\_per\_sg | Maximum number of rules for each security group | `number` | `50` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| egress\_security\_group\_ids | IDs of the security groups that control egress to the resource |
| ingress\_security\_group\_ids | IDs of the security groups that control ingress to the resource |
| security\_group\_ids | IDs of the security groups created by this module |
| security\_groups | Security groups created by this module |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# License
Apache 2 Licensed. See LICENSE for full details.
