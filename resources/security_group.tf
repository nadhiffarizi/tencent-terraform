# public az1
resource "tencentcloud_security_group" "nadhif_sg_subnet-public-az1" {
  name = "nadhif_sg_subnet-public-az1"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# web traffic
resource "tencentcloud_security_group_rule" "nadhif_sgrule_subnet-public-az1-web-in" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id
  type = "ingress"
  port_range = "80,443" # http(s)
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow ingress from internet"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_subnet-public-az1-all-out" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id
  type = "egress"
  ip_protocol = "ALL"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to all"
}


# intra
resource "tencentcloud_security_group_rule" "nadhif_sgrule_subnet-public-az1-intra" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id
  type = "ingress"
  ip_protocol = "ALL"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id
  description = "Allow ingress from within the same subnet"
}

# ssh access
resource "tencentcloud_security_group_rule" "nadhif_sgrule_subnet-public-az1-ssh" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id
  type = "ingress"
  port_range = "22"
  ip_protocol = "TCP"
  policy = "accept"
  cidr_ip = "0.0.0.0/0" # accessible from outside to bastion jump host
  description = "Allow ingress ssh to bastion/jump host"
}

# private az1
resource "tencentcloud_security_group" "nadhif_sg_subnet-private-az1" {
  name = "nadhif_sg_subnet-private-az1"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# intra
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az1-intra" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az1.id
  type = "ingress"
  ip_protocol = "ALL"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-private-az1.id
  description = "Allow ingress from within the same subnet"
}

# public-private access
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az1-publicsn" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az1.id
  type = "ingress"
  ip_protocol = "ALL"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id
  description = "Allow ingress from its public "
}

# web
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az1-all-out" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az1.id
  type = "egress"
  ip_protocol = "ALL"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress connection to the internet. Need NAT routing"
}

# SSH access
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az1-ssh" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az1.id
  type = "ingress"
  port_range = "22"
  ip_protocol = "TCP"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-public-az1.id # bastion/jump host
  policy = "accept"
  description = "Allow ingress ssh to access instance"
}


resource "tencentcloud_security_group" "nadhif_sg_subnet-public-az2" {
  name = "nadhif_sg_subnet-public-az2"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# intra
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-public-az2-intra" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id
  type = "ingress"
  ip_protocol = "ALL"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id
  description = "Allow ingress from within the same subnet"
}


# web
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-public-az2-web-in" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id
  type = "ingress"
  port_range = "80,443"
  ip_protocol = "TCP"
  policy = "accept"
  cidr_ip = "0.0.0.0/0"
  description = "Allow ingress from internet"
}

# all out egress
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-public-az2-all-out" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id
  type = "egress"
  ip_protocol = "ALL"
  policy = "accept"
  cidr_ip = "0.0.0.0/0"
  description = "Allow egress to internet"
}

resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-public-az2-ssh" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id
  type = "ingress"
  port_range = "22"
  ip_protocol = "TCP"
  policy = "accept"
  cidr_ip = "0.0.0.0/0" # accessible from outside to bastion jump host
  description = "Allow egress to internet"
}



resource "tencentcloud_security_group" "nadhif_sg_subnet-private-az2" {
  name = "nadhif_sg_subnet-private-az2"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# intra
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az2-intra" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az2.id
  type = "ingress"
  ip_protocol = "ALL"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-private-az2.id
  description = "Allow ingress from within the same subnet"
}

# public-private access
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az2-publicsn" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az2.id
  type = "ingress"
  ip_protocol = "ALL"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id
  description = "Allow ingress connection from public subnet."
}

# web
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az2-all-out" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az2.id
  type = "egress"
  ip_protocol = "ALL"
  policy = "accept"
  cidr_ip = "0.0.0.0/0"
  description = "Allow egress connection to the internet. Need NAT routing"
}

# ssh
resource "tencentcloud_security_group_rule" "nadhif_sg_subnet-private-az2-ssh" {
  security_group_id = tencentcloud_security_group.nadhif_sg_subnet-private-az2.id
  type = "ingress"
  port_range = "22"
  ip_protocol = "TCP"
  policy = "accept"
  source_sgid = tencentcloud_security_group.nadhif_sg_subnet-public-az2.id # bastion/jump host
  description = "Allow ssh access from jump host"
}