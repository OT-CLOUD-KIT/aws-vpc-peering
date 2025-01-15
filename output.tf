# outputs.tf
output "vpc_peering_connection_id" {
  description = "The ID of the VPC peering connection"
  value       = aws_vpc_peering_connection.peer.id
}

output "requester_route_table_ids" {
  description = "The route table IDs of the requester VPC"
  value       = data.aws_route_tables.requester.ids
}

output "accepter_route_table_ids" {
  description = "The route table IDs of the accepter VPC"
  value       = data.aws_route_tables.accepter.ids
}
