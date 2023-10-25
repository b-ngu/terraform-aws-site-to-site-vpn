output "vpn_gateway_id" {
  description = "The ID of the VPN gateway."
  value       = aws_vpn_gateway.vpn_gateway.id
}

output "customer_gateway_id" {
  description = "The ID of the customer gateway."
  value       = aws_customer_gateway.customer_gateway.id
}

output "vpn_connection_id" {
  description = "The ID of the VPN connection."
  value       = aws_vpn_connection.main.id
}
