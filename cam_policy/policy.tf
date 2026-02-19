resource "tencentcloud_cam_policy" "nadhif_policy_priv_cos_policy" {
  name        = "nadhif_policy_priv-cos-policy"
  description = "Allows access only to the ${var.cos_priv_bucket} ${tencentcloud_cam_role.nadhif_role_cvm-cos-role.name}"

  # Using jsonencode to inject variables dynamically
  document = jsonencode({
    version = "2.0"
    statement = [
      {
        effect = "allow"
        action = ["name/cos:*"]
        resource = [
            "qcs::cos:ap-jakarta:uid/${var.app_id}:${var.cos_priv_bucket}/*",
            "qcs::cos:ap-jakarta:uid/${var.app_id}:${var.cos_priv_bucket}"
        ]
      }
    ]
  })

  tags = {
    "owner" = "nadhif"
    "owner_email": "nadhiffarizi@lgsinarmas.com" 
  }
}

