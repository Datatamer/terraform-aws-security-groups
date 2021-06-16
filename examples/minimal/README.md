<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_id | n/a | `any` | n/a | yes |
| egress\_cidr\_blocks | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| ingress\_cidr\_blocks | n/a | `list` | <pre>[<br>  "1.2.3.4/0"<br>]</pre> | no |
| ingress\_ports | n/a | `list` | `[]` | no |
| sg\_name\_prefix | n/a | `string` | `"terraform-aws-security-groups-example"` | no |

## Outputs

| Name | Description |
|------|-------------|
| security-groups | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
