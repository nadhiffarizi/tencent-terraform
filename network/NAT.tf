resource "tencentcloud_nat_gateway" "nadhif_nat_test" {
  name = "nadhif_nat_test"
  vpc_id = tencentcloud_vpc.test_vpc.id
  subnet_id = tencentcloud_subnet.nadhif_subnet_public-az1.id
  assigned_eip_set =[ tencentcloud_eip.nadhif_eip_test.id ]
  tags = {
    "owner" = "nadhif"
    "owner" = "nadhiffarizi@lgsinarmas.com" 
  }
}

# resource "tencentcloud_eip_association" "nadhif_eipnat_az1" {
#   eip_id = tencentcloud_eip.nadhif_eip_az-1.id
#   instance_id = tencen
# }