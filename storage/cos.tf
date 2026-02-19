resource "tencentcloud_cos_bucket" "nadhif-cos-priv" {
  bucket = "nadhif-cos-priv-${var.app_id}"
  acl    = "private"
}
