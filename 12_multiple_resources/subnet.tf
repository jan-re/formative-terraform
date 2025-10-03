resource "aws_subnet" "subnet" {
  count = var.subnet_count

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "${local.project}-${count.index}"
  }
}
