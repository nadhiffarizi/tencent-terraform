resource "tencentcloud_instance" "nadhif_cvm_public" {
  instance_name = "nadhif_cvm_public"
  availability_zone = "ap-jakarta-1"
  image_id = data.tencentcloud_images.default.images[0].image_id
  instance_type = data.tencentcloud_instance_types.types.instance_types[0].instance_type

  #njetwork
  vpc_id = var.network_vpc_id
  subnet_id = var.subnet_public_az-1

  instance_charge_type = "POSTPAID_BY_HOUR"

   # system disk
   system_disk_type = "CLOUD_BSSD"
   system_disk_size = 50

   # public network 
   allocate_public_ip = true
   internet_max_bandwidth_out = 5

   # sg
   orderly_security_groups = [ var.sg_public ]

   # role
   cam_role_name = var.cvm_cos_role

   # tagging
   tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com" 
   }
}