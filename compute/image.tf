# fetch available ubuntu image
data "tencentcloud_images" "default" {
    image_type = [ "PUBLIC_IMAGE" ]
    os_name = "Ubuntu Server 24.04 LTS 64bit"
} 

data "tencentcloud_instance_types" "types" {
   filter {
    name   = "instance-family"
    values = ["S5"]
  }
  cpu_core_count = 2
  memory_size    = 2
}