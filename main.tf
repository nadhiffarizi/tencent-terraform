provider "tencentcloud" {
    region = var.region_name
    secret_id = var.secret_id
    secret_key = var.secret_key
}

terraform {
    required_providers {
        tencentcloud = {
            source = "tencentcloudstack/tencentcloud"
        }
    }
}


data "tencentcloud_availability_regions" "test" {}


output "hello_world_test" {
    value = "Connection Successful! Available regions: ${join(", ", data.tencentcloud_availability_regions.test.regions[*].name)}"
}

