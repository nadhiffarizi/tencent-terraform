
resource "tencentcloud_cam_role" "nadhif_role_cvm-cos-role" {
  name          = "nadhif_role_cvm-cos-role"
  document      = <<EOF
{
  "version": "2.0",
  "statement": [
    {
      "action": [
        "name/sts:AssumeRole"
      ],
      "effect": "allow",
      "principal": {
        "service": [
          "cvm.qcloud.com"
        ]
      }
    }
  ]
}
EOF
  description   = "test"
  console_login = true
  tags = {
    "owner" = "nadhif",
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# binding role
resource "tencentcloud_cam_role_policy_attachment" "nadhif_role_policy_attach-cvm" {
  role_id   = tencentcloud_cam_role.nadhif_role_cvm-cos-role.id
  policy_id = tencentcloud_cam_policy.nadhif_policy_priv_cos_policy.id
}

