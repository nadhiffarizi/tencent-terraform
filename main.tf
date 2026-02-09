terraform {
    required_providers {
        tencentcloud = {
            source = "tencentcloudstack/tencentcloud"
        }
    }
}

data "tencentcloud_availability_regions" "test" {}

provider "tencentcloud" {
    region = "ap-guangzhou"
    secret_id = var.secret_id
    secret_key = var.secret_key
}



output "hello_world_test" {
    value = "Connection Successful! Available regions: ${join(", ", data.tencentcloud_availability_regions.test.regions[*].name)}"
}

