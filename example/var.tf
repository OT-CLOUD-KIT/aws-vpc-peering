# variables.tf

###################################################
###########  Requester VPC Details  ###############
###################################################
variable "requester_profile" {
  description = "The profile of the requester VPC"
  type        = string
  default     = "default"
}

variable "requester_vpc_id" {
  description = "The ID of the requester VPC"
  type        = string
}

variable "requester_region" {
  description = "The region of the requester VPC"
  type        = string
}

###################################################
###########  Acceptor VPC Details  ################
###################################################

variable "acceptor_profile" {
  description = "The profile of the acceptor VPC"
  type        = string
  default     = "default"
}

variable "accepter_vpc_id" {
  description = "The ID of the accepter VPC"
  type        = string
}

variable "accepter_region" {
  description = "The region of the accepter VPC"
  type        = string
}

###################################################
##############  Peering Details  ##################
###################################################

variable "auto_accept" {
  description = "Flag to automatically accept the peering connection"
  type        = bool
  default     = true
}

variable "enable_routes" {
  description = "Flag to enable or disable route table entries"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to peering"
  type        = map(string)
  default = {
    Name        = "ot-cloud-vpc-peering"
    Environment = "Development"
    Project     = "VPC Peering"
    Owner       = "opstree"
  }
}
