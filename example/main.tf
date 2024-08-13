module "vpc_peering" {
  source = "../"  # Update this path to where your module is located

  requester_vpc_id         = var.requester_vpc_id
  accepter_vpc_id          = var.accepter_vpc_id
  requester_region         = var.requester_region
  accepter_region          = var.accepter_region
  peering_connection_name  = var.peering_connection_name
}
