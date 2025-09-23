resource "aws_security_group" "http_security_group" {
  name        = "Allow HTTP"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Project = "nginx"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http_allow_ipv4" {
  security_group_id = aws_security_group.http_security_group.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "http_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.http_security_group.id
  cidr_ipv4         = "0.0.0.0/0" # semantically equivalent to every IP address
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "https_security_group" {
  name        = "Allow HTTPS"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Project = "nginx"
  }
}

resource "aws_vpc_security_group_ingress_rule" "https_allow_ipv4" {
  security_group_id = aws_security_group.https_security_group.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "https_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.https_security_group.id
  cidr_ipv4         = "0.0.0.0/0" # semantically equivalent to every IP address
  ip_protocol       = "-1" # semantically equivalent to all ports
}
