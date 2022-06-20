resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = "ipsec.1"
  static_routes_only  = true

  depends_on = [
    aws_vpn_gateway_route_propagation.pri-route,
    aws_vpn_gateway_route_propagation.pub-route
  ]
}
resource "aws_vpn_connection_route" "local" {
  destination_cidr_block = "10.100.0.0/24" # local or IDC subnet
  vpn_connection_id      = aws_vpn_connection.main.id
}