resource "tencentcloud_subnet" "nadhif_subnet_public-az1" {
    name = "nadhif_subnet_public-az1"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-jakarta-1" 
    is_multicast = false
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

resource "tencentcloud_subnet" "nadhif_subnet_private-az1" {
    name = "nadhif_subnet_private-az1"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-jakarta-1" 
    is_multicast = false
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

resource "tencentcloud_subnet" "nadhif_subnet_public-az2" {
    name = "nadhif_subnet_public-az2"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-jakarta-2" 
    is_multicast = false
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

resource "tencentcloud_subnet" "nadhif_subnet_private-az2" {
    name = "nadhif_subnet_private-az2"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-jakarta-2" 
    is_multicast = false
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

# public routing
resource "tencentcloud_route_table_association" "nadhif_rta_public-sn-az1" {
  route_table_id = tencentcloud_route_table.nadhif_rt_public-rt.id
  subnet_id = tencentcloud_subnet.nadhif_subnet_public-az1.id
}

resource "tencentcloud_route_table_association" "nadhif_rta_public-sn-az2" {
  route_table_id = tencentcloud_route_table.nadhif_rt_public-rt.id
  subnet_id = tencentcloud_subnet.nadhif_subnet_public-az2.id
}


# private routing
resource "tencentcloud_route_table_association" "nadhif_rta_private-sn-az1" {
  route_table_id = tencentcloud_route_table.nadhif_rt_private-rt.id
  subnet_id = tencentcloud_subnet.nadhif_subnet_private-az1.id
}

resource "tencentcloud_route_table_association" "nadhif_rta_private-sn-az2" {
  route_table_id = tencentcloud_route_table.nadhif_rt_private-rt.id
  subnet_id = tencentcloud_subnet.nadhif_subnet_private-az2.id
}