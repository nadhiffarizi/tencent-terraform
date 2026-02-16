provider "tencentcloud" {
    region = "ap-jakarta"
}

terraform {
    required_providers {
        tencentcloud = {
            source = "tencentcloudstack/tencentcloud"
        }
    }
    backend "cos" {
        region = "ap-jakarta"
        bucket = "nadhif-lgsm-tf-1385797712" 
        prefix = "terraform/state"           
    }
}


module "network" {
    source = "./network"
}


data "tencentcloud_availability_regions" "test" {}


output "hello_world_test" {
    value = "Connection Successful! Available regions: ${join(", ", data.tencentcloud_availability_regions.test.regions[*].name)}"
}

