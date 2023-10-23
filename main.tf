resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = var.vpc_id

  tags = merge(
    { "Name" = "${local.resource_prefix}-vpn-gateway" },
    var.tags,
  )
}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = var.customer_gateway_bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = merge(
    { "Name" = "${local.resource_prefix}-customer-gateway" },
    var.tags,
  )
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true  # Set this to false if you're using BGP.

  tags = merge(
    { "Name" = "${local.resource_prefix}-vpn-connection" },
    var.tags,
  )
}
