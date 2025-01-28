resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  count           = length(var.subnet_cidrs)
  vpc_id          = aws_vpc.main.id
  cidr_block      = var.subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.vpc_name}-subnet-${count.index}"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.subnet[*].id
}
