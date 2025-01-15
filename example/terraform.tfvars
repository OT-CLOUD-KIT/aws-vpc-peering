  requester_vpc_id         = "vpc-0c22cb7ba82513361"
  accepter_vpc_id          = "vpc-012faafc8f3d26419"
  requester_region         = "us-west-2"
  accepter_region          = "ap-south-1"
  auto_accept              = true
  enable_routes            = false
  tags = {
    Name        = "ot-cloud-vpc-peering"
    Environment = "Production"
    Project     = "OT-Cross-Account VPC Peering"
    Owner       = "Opstree Team"
  }