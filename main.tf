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

data "tencentcloud_user_info" "info" {}

locals {
  app_id = data.tencentcloud_user_info.info.app_id
  owner_uin = data.tencentcloud_user_info.info.owner_uin
}


module "network" {
    source = "./network"
}

module "cam" {
  source = "./cam_policy"
  app_id = local.app_id
  owner_uin = local.owner_uin
  cos_priv_bucket = module.storage.cos_priv-bucket
  cvm_id = module.compute.nadhif_cvm_public
}

module storage {
    source = "./storage"
    app_id = local.app_id
}

module "compute" {
    source = "./compute"
    network_vpc_id = module.network.vpc_test
    sg_public = module.network.nadhif_sg_public-sg
    subnet_public_az-1 = module.network.nadhif_subnet_public_az-1
    cvm_cos_role = module.cam.nadhif_role_cvm-cos-rolename
}


data "tencentcloud_availability_regions" "test" {}


output "hello_world_test" {
    value = "Connection Successful! Available regions: ${join(", ", data.tencentcloud_availability_regions.test.regions[*].name)}"
}

