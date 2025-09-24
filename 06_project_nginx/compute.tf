resource "aws_instance" "web" {
  ami                         = "ami-002e9c5a1e420852e" # bitnami nginx ami
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.subnet_public.id
  vpc_security_group_ids      = [aws_security_group.public_traffic.id]

  lifecycle {
    create_before_destroy = true
  }

  tags = local.common_tags
}
