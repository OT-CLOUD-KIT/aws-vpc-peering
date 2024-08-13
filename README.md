# aws-vpc-peering

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This repository consists of the Terraform module for AWS VPC Peering Service with in & cross region.
- This project is a part of opstree's ot-aws initiative for terraform modules.

## Usage

```sh
$   cat main.tf
/*-------------------------------------------------------*/
module "vpc_peering" {
  source = "../"  # Update this path to where your module is located

  requester_vpc_id         = var.requester_vpc_id
  accepter_vpc_id          = var.accepter_vpc_id
  requester_region         = var.requester_region
  accepter_region          = var.accepter_region
  peering_connection_name  = var.peering_connection_name
}

/*-------------------------------------------------------*/
```

```sh
$   cat output.tf
/*-------------------------------------------------------*/
output "vpc_peering_id" {
  value = module.aws_vpc_peering.id
}
/*-------------------------------------------------------*/
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| requester_region | The region of the requester VPC. | `string` | `us-east-1` | yes |
| accepter_region | The region of the accepter VPC. | `string` | `us-east-1` | yes |
| requester_vpc_cidr | The CIDR of the requester VPC. | `string` | `10.0.0.0/16` | yes |
| accepter_vpc_cidr | The CIDR of the accepter VPC. | `string` | `172.31.0.0/16` | yes |
| vpc_peering_connection_requester_name | The NAME of the requester VPC peering connection. | `string` | `requester` | yes |
| vpc_peering_connection_accepter_name | The NAME of the accepter VPC peering connection. | `string` | `accepter` | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the VPC Peering Connection |

## Related Projects

Check out these related projects.

- [network_skeleton](https://gitlab.com/ot-aws/terrafrom_v0.12.21/network_skeleton) - Terraform module for providing a general purpose Networking solution
- [security_group](https://gitlab.com/ot-aws/terrafrom_v0.12.21/security_group) - Terraform module for creating dynamic Security groups
- [eks](https://gitlab.com/ot-aws/terrafrom_v0.12.21/eks) - Terraform module for creating elastic kubernetes cluster.
- [HA_ec2_alb](https://gitlab.com/ot-aws/terrafrom_v0.12.21/ha_ec2_alb.git) - Terraform module for creating a Highly available setup of an EC2 instance with quick disater recovery.
- [HA_ec2](https://gitlab.com/ot-aws/terrafrom_v0.12.21/ha_ec2.git) - Terraform module for creating a Highly available setup of an EC2 instance with quick disater recovery.
- [rolling_deployment](https://gitlab.com/ot-aws/terrafrom_v0.12.21/rolling_deployment.git) - This terraform module will orchestrate rolling deployment.

### Contributors

[![Shweta Tyagi][shweta_avatar]][shweta_homepage]<br/>[Shweta Tyagi][shweta_homepage] 

  [shweta_homepage]: https://github.com/shwetatyagi-ot
  [shweta_avatar]: https://img.cloudposse.com/75x75/https://github.com/shwetatyagi-ot.png
