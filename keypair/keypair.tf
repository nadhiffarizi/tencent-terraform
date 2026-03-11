resource "tencentcloud_key_pair" "nadhif_keypair_pb" {
    key_name = "nadhif_keypair_pb"
    tags ={
      "owner" = "nadhif"
      "owner_email" = "nadhiffarizi@lgsinarmas.com" 
    }
}