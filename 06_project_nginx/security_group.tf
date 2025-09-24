resource "aws_security_group" "public_traffic" {
  name   = "public-traffic"
  vpc_id = aws_vpc.vpc.id

  tags = local.common_tags
}

resource "aws_vpc_security_group_ingress_rule" "http_allow_ipv4" {
  security_group_id = aws_security_group.public_traffic.id
  cidr_ipv4         = "0.0.0.0/0" 
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_allow_ipv4" {
  security_group_id = aws_security_group.public_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
