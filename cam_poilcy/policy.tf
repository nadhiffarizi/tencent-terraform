resource "tencentcloud_cam_policy" "specific_cos_policy" {
  name        = "nadhif-specific-bucket-access"
  description = "Allows access only to the nadhif-terraform-bucket"
  
  # The JSON document defines the "Powers"
  document = <<EOF
{
    "version": "2.0",
    "statement": [
        {
            "effect": "allow",
            "action": [
                "name/cos:PutObject",
                "name/cos:GetObject",
                "name/cos:HeadObject",
                "name/cos:OptionsObject",
                "name/cos:ListObjects"
            ],
            "resource": [
                "qcs::cos:ap-guangzhou:uid/1385797712:nadhif-lgsm-tf-1385797712/*",
                "qcs::cos:ap-guangzhou:uid/1385797712:nadhif-lgsm-tf-1385797712"
            ]
        }
    ]
}
EOF
}
