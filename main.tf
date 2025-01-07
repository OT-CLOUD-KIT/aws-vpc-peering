# main.tf
provider "aws" {
  region = var.requester_region  # Requester's region
}

provider "aws" {
  alias  = "peer_acceptor_provider"
  region = var.accepter_region  # Accepter's region
}

# Create VPC Peering Connection
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id
  peer_owner_id = data.aws_caller_identity.peer.account_id
  auto_accept = false  
  peer_region = var.accepter_region

  tags = {
    Name = var.peering_connection_name
  }
}

# Accept the VPC Peering Connection (run in the accepter account/region)
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.peer_acceptor_provider
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = "${var.peering_connection_name}-accepter"
  }
}

# Add routes to the requester's VPC route table
resource "aws_route" "requester_route" {
  count                  = length(data.aws_route_tables.requester.ids)
  route_table_id         = data.aws_route_tables.requester.ids[count.index]
  destination_cidr_block = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# Add routes to the accepter's VPC route table
resource "aws_route" "accepter_route" {
  provider               = aws.peer_acceptor_provider
  count                  = length(data.aws_route_tables.accepter.ids)
  route_table_id         = data.aws_route_tables.accepter.ids[count.index]
  destination_cidr_block = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# Data resources to get existing route tables and VPC CIDR blocks
data "aws_caller_identity" "peer" {
  provider = aws.peer_acceptor_provider
}

data "aws_vpc" "requester" {
  id = var.requester_vpc_id
}

data "aws_vpc" "accepter" {
  provider = aws.peer_acceptor_provider
  id       = var.accepter_vpc_id
}

data "aws_route_tables" "requester" {
  vpc_id = var.requester_vpc_id
}

data "aws_route_tables" "accepter" {
  provider = aws.peer_acceptor_provider
  vpc_id   = var.accepter_vpc_id
}
