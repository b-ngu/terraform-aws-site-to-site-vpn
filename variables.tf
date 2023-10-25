variable "vpc_id" {
  description = "The ID of the VPC where the VPN gateway will be attached."
  type        = string
}

variable "customer_gateway_ip" {
  description = "The IP address of the customer gateway's Internet-routable external interface."
  type        = string
}

variable "customer_gateway_bgp_asn" {
  description = "The Border Gateway Protocol (BGP) Autonomous System Number (ASN) of the customer gateway."
  default     = "65000"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "contact" {
  type        = string
  description = "(Required) The contact for this resource."
}

variable "environment" {
  type        = string
  description = "(Required) The environment where this resource will live."
}

variable "team" {
  type        = string
  description = "(Required) The team responsible for this resource."
}

variable "purpose" {
  type        = string
  description = "(Required) The purpose for this resource."
}