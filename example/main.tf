module "vpc_peering" {
  source = "../"  # Update this path to where your module is located
  requester_profile        = var.requester_profile
  acceptor_profile         = var.acceptor_profile
  requester_vpc_id         = var.requester_vpc_id
  accepter_vpc_id          = var.accepter_vpc_id
  requester_region         = var.requester_region
  accepter_region          = var.accepter_region
  auto_accept              = var.auto_accept
  enable_routes            = var.enable_routes
  tags                     = var.tags
}
