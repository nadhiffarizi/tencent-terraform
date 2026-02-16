resource "tencentcloud_eip" "nadhif_eip_test" {
  name = "nadhif_eip_test"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}