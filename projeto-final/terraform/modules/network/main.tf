data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  # Both default to false on a custom VPC. Without enable_dns_hostnames,
  # aws_instance.public_dns comes back empty -- and that output is required.
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-vpc"
  })
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.available.names[0]
  # /16 + 8 bits = /24, slice 0: 10.20.0.0/16 -> 10.20.0.0/24
  cidr_block = cidrsubnet(aws_vpc.this.cidr_block, 8, 0)

  # True by default only on the default VPC; false on a custom one, which
  # would launch the instance with no public IP.
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-public-subnet"
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-igw"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-public-rt"
  })
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# This is what actually makes the subnet public. Without it the subnet stays
# on the VPC's default route table, which has no internet route: apply
# succeeds, every resource exists, and nothing responds.
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
