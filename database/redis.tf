resource "tencentcloud_redis_instance" "nadhif_nosqldb_redis-pgdb-instance" {
  name              = "nadhif_nosqldb_redis-pgdb-instance"
  availability_zone = var.availability_zone 
  type_id           = 7                # Standard Edition
  mem_size          = 8192             # 8GB
  password          = "Password123!"
  vpc_id            = var.network_vpc_id
  subnet_id         = var.subnet_id
  security_groups = [ var.sg_db_id ]
  tags = {
    "owner"  = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}
