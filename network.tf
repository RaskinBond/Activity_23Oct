resource "aws_vpc" "ntier_vpc" {
  count       = local.count
  cidr_block  = var.network_cidrs[count.index]
  
  tags        = {
    Name      = local.vpc_tags[count.index]
  }
}

resource "aws_subnet" "public_subnet" {
  count       = length(var.subnet_tags)
  vpc_id      = aws_vpc.ntier_vpc[0].id
  cidr_block  = cidrsubnet(var.ntier_cidr[0], 8, count.index)
  
  tags        = {
    Name      = var.subnet_tags[count.index]
  }
  depends_on  = [ aws_vpc.ntier_vpc ]
}

resource "aws_subnet" "private_subnet" {
  count       = length(var.subnet_tags)
  vpc_id      = aws_vpc.ntier_vpc[1].id
  cidr_block  = cidrsubnet(var.ntier_cidr[1], 8, count.index)
  
  tags        = {
    Name      = var.subnet_tags[count.index]
  }
  depends_on  = [ aws_subnet.public_subnet ]
}