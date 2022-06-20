resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 64789
  ip_address = var.CGW
  type       = "ipsec.1"

  tags = {
    Name = "main-customer-gateway"
  }
}