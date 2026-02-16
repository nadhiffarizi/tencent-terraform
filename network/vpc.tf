resource "tencentcloud_vpc" "test_vpc" { 
    cidr_block = "10.0.0.0/16"
    name = "nadhif_vpc_test"
    is_multicast = false
    tags = {
        "owner" = "nadhif"
        "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}