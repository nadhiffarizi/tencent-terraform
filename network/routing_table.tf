# resource "tencentcloud_route_table" "nadhif_rt_public-az1-rt" {
#   name = "nadhif_rt_public-rt"
#   vpc_id = tencentcloud_vpc.test_vpc.id
#   tags = {
#     "owner" = "nadhif"
#     "owner_email" = "nadhiffarizi@lgsinarmas.com"
#   }
# }

# # routing table entry
# resource "tencentcloud_route_table_entry" "nadhif_rte_public-rt" {
#   route_table_id = tencentcloud_route_table.nadhif_rt_public-az1-rt.id
#   destination_cidr_block = "0.0.0.0/0" # to internet
#   next_hub = "" 
#   next_type = "NAT" # if routing to destination cidr block, go to NAT
# }