output "private_key_id" {
  value     = tencentcloud_key_pair.nadhif_keypair_pb.id
  sensitive = true
}

output "private_key" {
  value     = tencentcloud_key_pair.nadhif_keypair_pb.private_key
  sensitive = true
}