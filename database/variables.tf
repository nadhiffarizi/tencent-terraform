variable "network_vpc_id" {
  type        = string
  description = "The ID of the VPC created in the network module"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet which the db is created on"
}

variable "availability_zone" {
  type        = string
  description = "AZ where the db is created on"
}

variable "sg_db_id" {
  type = string
  description = "sg for db"
}
