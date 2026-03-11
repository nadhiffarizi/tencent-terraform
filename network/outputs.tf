output "vpc_test" {
   value = tencentcloud_vpc.test_vpc.id
}

output "nadhif_sg_public-sg" {
  value = tencentcloud_security_group.nadhif_sg_public-sg.id
}

output "nadhif_sg_db" {
  value = tencentcloud_security_group.db-sg.id
}

output "nadhif_subnet_public_az-1" {
  value = tencentcloud_subnet.nadhif_subnet_public-az1.id
}

output "nadhif_subnet_private_az-1" {
  value = tencentcloud_subnet.nadhif_subnet_private-az1.id
}