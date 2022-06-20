resource "aws_vpn_gateway" "vgw" {
  tags = {
    Name = "example-vpn-gateway"
  }
} # vgw

resource "aws_vpn_gateway_attachment" "vpn_attachment" {
  vpc_id         = data.terraform_remote_state.network.outputs.vpc_id
  vpn_gateway_id = aws_vpn_gateway.vgw.id
} # attach

resource "aws_vpn_gateway_route_propagation" "pri-route" {
  vpn_gateway_id = aws_vpn_gateway.vgw.id
  route_table_id = data.terraform_remote_state.network.outputs.RT_nat_id

  depends_on = [
    aws_vpn_gateway.vgw
  ]
} # route propagation
resource "aws_vpn_gateway_route_propagation" "pub-route" {
  vpn_gateway_id = aws_vpn_gateway.vgw.id
  route_table_id = data.terraform_remote_state.network.outputs.RT_igw_id
  
  depends_on = [
    aws_vpn_gateway.vgw
  ]
} # route propagation