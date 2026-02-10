resource "tencentcloud_subnet" "nadhif_subnet_public-az1" {
    name = "nadhif_subnet_public-az1"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-guangzhou-1" 
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

resource "tencentcloud_subnet" "nadhif_subnet_private-az1" {
    name = "nadhif_subnet_private-az1"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-guangzhou-1" 
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

resource "tencentcloud_subnet" "nadhif_subnet_public-az2" {
    name = "nadhif_subnet_public-az2"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-guangzhou-2" 
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}

resource "tencentcloud_subnet" "nadhif_subnet_private-az2" {
    name = "nadhif_subnet_private-az2"
    vpc_id = tencentcloud_vpc.test_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-guangzhou-2" 
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}