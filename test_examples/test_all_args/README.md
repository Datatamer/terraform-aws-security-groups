<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress\_protocol | Protocol for egress rules. If not icmp, icmpv6, tcp, udp, or all use the protocol number. | `string` | n/a | yes |
| ingress\_ports | Ports to create ingress traffic rules for | `list(number)` | n/a | yes |
| ingress\_protocol | Protocol for ingress rules. If not icmp, icmpv6, tcp, udp, or all use the protocol number. | `string` | n/a | yes |
| sg\_name\_prefix | Prefix for security group names | `string` | n/a | yes |
| egress\_cidr\_blocks | CIDR blocks to attach to security groups for egress | `list(string)` | `[]` | no |
| egress\_security\_groups | Existing security groups to attach to new security groups for egress | `list(string)` | `[]` | no |
| ingress\_cidr\_blocks | CIDR blocks to attach to security groups for ingress | `list(string)` | `[]` | no |
| ingress\_security\_groups | Existing security groups to attach to new security groups for ingress | `list(string)` | `[]` | no |
| maximum\_rules\_per\_sg | Maximum number of rules for each security group | `number` | `50` | no |
| tags | Tags to be attached to the resources created | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| module-security-groups | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
