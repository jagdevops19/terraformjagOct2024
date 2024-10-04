#Internet VPC
resource "aws_vpc" "main-jag" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    #enable_classiclink = "false"
    tags = {
        Name = "main-jag"
    }
}

#Subnets 
resource "aws_subnet" "main-public-1-jag" {
    vpc_id = aws_vpc.main-jag.id
   cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "main-public-1-jag"
    }
}

resource "aws_subnet" "main-public-2-jag" {
    vpc_id = aws_vpc.main-jag.id
   cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "main-public-2-jag"
    }
}

resource "aws_subnet" "main-public-3-jag" {
    vpc_id = aws_vpc.main-jag.id
   cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2c"

    tags = {
        Name = "main-public-3-jag"
    }
}

resource "aws_subnet" "main-private-1-jag" {
    #vpc_id = "${aws_vpc.main.id}"
    vpc_id = aws_vpc.main-jag.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "main-private-1-jag"
    }
}

resource "aws_subnet" "main-private-2-jag" {
    #vpc_id = "${aws_vpc.main.id}"
    vpc_id = aws_vpc.main-jag.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "main-private-2-jag"
    }
}

resource "aws_subnet" "main-private-3-jag" {
    #vpc_id = "${aws_vpc.main.id}"
    vpc_id = aws_vpc.main-jag.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "main-private-3-jag"
    }
}

 #Internet GW
resource "aws_internet_gateway" "main-gw" {
    #vpc_id = "${aws_vpc.main.id}"
    vpc_id = aws_vpc.main-jag.id
    tags = {
        Name = "main-jag"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    #vpc_id = "${aws_vpc.main.id}"
    vpc_id = aws_vpc.main-jag.id
    route {
        cidr_block = "0.0.0.0/0"
        #gateway_id = "${aws_internet_gateway.main-gw.id}"
        gateway_id = aws_internet_gateway.main-gw.id
    }

    tags = {
        Name = "main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
    #subnet_id = "${aws_subnet.main-public-1.id}"
    #route_table_id = "${aws_route_table.main-public.id}"
    subnet_id = aws_subnet.main-public-1-jag.id
    route_table_id = aws_route_table.main-public.id
}
resource "aws_route_table_association" "main-public-2-a" {
    #subnet_id = "${aws_subnet.main-public-2.id}"
    #route_table_id = "${aws_route_table.main-public.id}"
    subnet_id = aws_subnet.main-public-2-jag.id
    route_table_id = aws_route_table.main-public.id
}
resource "aws_route_table_association" "main-public-3-a" {
    #subnet_id = "${aws_subnet.main-public-3.id}"
    #route_table_id = "${aws_route_table.main-public.id}"
    subnet_id = aws_subnet.main-public-3-jag.id
    route_table_id = aws_route_table.main-public.id
}
