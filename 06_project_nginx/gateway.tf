resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.common_tags, {
    name = "gateway-01"
  })
}
