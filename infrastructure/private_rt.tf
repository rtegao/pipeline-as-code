resource "aws_eip" "nat" {
  vpc      = true

  tags = {
    Name = "eip-nat_${var.vpc_name}"
    Author = var.author

  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.public_subnets.*.id,0)

  tags = {
    Name = "nat_${var.vpc_name}"
    Author = var.author
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.management.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "private_rt_${var.vpc_name}"
    Author = var.author
  }
}

resource "aws_route_table_association" "private" {
    count = var.private_subnets_count
    subnet_id = element(aws_subnet.private_subnets.*.id, count.index)
    route_table_id = aws_route_table.private_rt.id
}