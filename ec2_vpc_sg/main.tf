#vpc

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
}

#public_subnet

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.dev.id
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

}

# igw

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

}


resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id
    route {

        cidr_block = "0.0.0.0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "public-route"

    }
}


resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public
}
       


