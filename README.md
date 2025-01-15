# aws-vpc-peering

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This repository provides a Terraform module for creating AWS VPC Peering connections, supporting both intra-region and cross-region configurations. 
- This project is part of Opstree's OT-AWS initiative for Terraform modules.

## Usage
`main.tf`
```sh
module "vpc_peering" {
  source = "../"  # Update this path to where your module is located

  requester_vpc_id         = var.requester_vpc_id
  accepter_vpc_id          = var.accepter_vpc_id
  requester_region         = var.requester_region
  accepter_region          = var.accepter_region
  peering_connection_name  = var.peering_connection_name
  auto_accept              = var.auto_accept
  enable_routes            = var.enable_routes
}
```
`output.tf`
```sh
output "vpc_peering_id" {
  value = module.aws_vpc_peering.id
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `requester_profile` | AWS Profile name for requester VPC. | `string` | `default` | not |
| `requester_region` | The region of the requester VPC. | `string` | n/a | yes |
| `requester_vpc_id` | The ID of the requester VPC. | `string` | n/a | yes |
| `acceptor_profile` | AWS Profile name for acceptor VPC. | `string` | `default` | Required in cross-account peering |
| `accepter_region` | The region of the accepter VPC. | `string` | n/a | yes |
| `accepter_vpc_id` | The ID of the accepter VPC. | `string` | n/a | yes |
| `auto_accept` | Automatically accept the peering request. | `bool` | `true` | yes |
| `enable_routes` | Enable or disable route table updates. | `string` | `true` | yes |
| `tags` | Tags to assign to VPC peering connection. | `map` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| `vpc_peering_connection_id` | The ID of the VPC Peering Connection |
| `requester_route_table_ids` | Route table IDs in the requester VPC |
| `accepter_route_table_ids` | Route table IDs in the accepter VPC |

## Related Projects

Check out these related projects.

- [network_skeleton](https://gitlab.com/ot-aws/terrafrom_v0.12.21/network_skeleton) - Terraform module for providing a general purpose Networking solution
- [security_group](https://gitlab.com/ot-aws/terrafrom_v0.12.21/security_group) - Terraform module for creating dynamic Security groups
- [eks](https://gitlab.com/ot-aws/terrafrom_v0.12.21/eks) - Terraform module for creating elastic kubernetes cluster.
- [HA_ec2_alb](https://gitlab.com/ot-aws/terrafrom_v0.12.21/ha_ec2_alb.git) - Terraform module for creating a Highly available setup of an EC2 instance with quick disater recovery.
- [HA_ec2](https://gitlab.com/ot-aws/terrafrom_v0.12.21/ha_ec2.git) - Terraform module for creating a Highly available setup of an EC2 instance with quick disater recovery.
- [rolling_deployment](https://gitlab.com/ot-aws/terrafrom_v0.12.21/rolling_deployment.git) - This terraform module will orchestrate rolling deployment.

### Contributors

- [Ankit](https://www.linkedin.com/in/ankit-mishra-aab383210/) 
- [Rajat Vats](https://www.linkedin.com/in/rajat-vats-32042aa9/)
