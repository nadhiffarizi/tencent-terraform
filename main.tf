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

module "compute" {
    source = "./compute"
    network_vpc_id = module.network.vpc_test
    sg_public = module.network.nadhif_sg_public-sg
    subnet_public_az-1 = module.network.nadhif_subnet_public_az-1
}


data "tencentcloud_availability_regions" "test" {}


output "hello_world_test" {
    value = "Connection Successful! Available regions: ${join(", ", data.tencentcloud_availability_regions.test.regions[*].name)}"
}

