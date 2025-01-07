# variables.tf
variable "requester_vpc_id" {
  description = "The ID of the requester VPC"
  type        = string
}

variable "accepter_vpc_id" {
  description = "The ID of the accepter VPC"
  type        = string
}

variable "requester_region" {
  description = "The region of the requester VPC"
  type        = string
}

variable "accepter_region" {
  description = "The region of the accepter VPC"
  type        = string
}

variable "peering_connection_name" {
  description = "Name tag for the VPC peering connection"
  type        = string
  default     = "vpc-peering-connection"
}
