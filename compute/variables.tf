# ./compute/variables.tf
variable "network_vpc_id" {
  type        = string
  description = "The ID of the VPC created in the network module"
}

variable "subnet_public_az-1" {
  type = string
  description = "public subnet for az 1"
}

variable "sg_public" {
  type = string
  description = "public security group"
}