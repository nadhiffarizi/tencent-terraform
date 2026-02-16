resource "tencentcloud_route_table" "nadhif_rt_private-rt" {
  name = "nadhif_rt_private-rt"
  vpc_id = tencentcloud_vpc.test_vpc.id
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# entry
resource "tencentcloud_route_table_entry" "nadhif_rte_to-nat" {
  route_table_id = tencentcloud_route_table.nadhif_rt_private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  next_type = "NAT"
  next_hub = tencentcloud_nat_gateway.nadhif_nat_test.id
}