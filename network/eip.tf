resource "tencentcloud_eip" "nadhif_eip_test" {
  name = "nadhif_eip_test"
  type = "EIP"
  internet_max_bandwidth_out = 5                      # Bandwidth limit in Mbps
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}