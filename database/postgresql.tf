resource "tencentcloud_postgresql_instance" "nadhif_sqldb_tencent-pgdb-instance" {
    name        = "nadhif_db_tencent-pgdb-instance"
    vpc_id = var.network_vpc_id
    subnet_id = var.subnet_id
    availability_zone= var.availability_zone
    security_groups =[ var.sg_db_id ]
    db_major_version = "18"
    memory            = 2      # GB
    storage           = 20     # GB
    root_user         = "dbadmin" 
    root_password     = "Password123!"
    charge_type       = "POSTPAID_BY_HOUR"
    tags ={
      "owner" = "nadhif"
      "owner_email" = "nadhiffarizi@lgsinarmas.com"
    }
}