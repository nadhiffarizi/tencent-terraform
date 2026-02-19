# public access
resource "tencentcloud_security_group" "nadhif_sg_public-sg" {
  name = "nadhif_sg_public-sg"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com" 
  }
}

# app access
resource "tencentcloud_security_group" "nadhif_sg_be-app-sg" {
  name = "nadhif_sg_be-app-sg"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

# db access
resource "tencentcloud_security_group" "db-sg" {
  name = "nadhif_sg_db-sg"
  tags = {
    "owner" = "nadhif"
    "owner_email" = "nadhiffarizi@lgsinarmas.com"
  }
}

## SG RULE
# web traffic
resource "tencentcloud_security_group_rule" "nadhif_sgrule_public-sg" {
  security_group_id = tencentcloud_security_group.nadhif_sg_public-sg.id
  type = "ingress"
  port_range = "443" # https
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow ingress from internet"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_public-sg-ssh" {
  security_group_id = tencentcloud_security_group.nadhif_sg_public-sg.id
  type = "ingress"
  port_range = "22" # SSH
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow ingress from internet for ssh"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_public-sg-out-tcp" {
  security_group_id = tencentcloud_security_group.nadhif_sg_public-sg.id
  type = "egress"
  port_range = "443" 
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to internet for https request"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_public-sg-out-icmp" {
  security_group_id = tencentcloud_security_group.nadhif_sg_public-sg.id
  type = "egress"
  ip_protocol = "ICMP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to internet for pinging"
}

# App traffic
resource "tencentcloud_security_group_rule" "nadhif_sgrule_be-app-sg-publicsn" {
  security_group_id = tencentcloud_security_group.nadhif_sg_be-app-sg.id
  type = "ingress"
  port_range = "80,443" # http(s)
  ip_protocol = "TCP"
  source_sgid = tencentcloud_security_group.nadhif_sg_public-sg.id
  policy = "accept"
  description = "Allow ingress from public subnet"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_be-app-sg-ssh" {
  security_group_id = tencentcloud_security_group.nadhif_sg_be-app-sg.id
  type = "ingress"
  port_range = "22" # http(s)
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow SSH from internet"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_be-app-sg-out-tcp" {
  security_group_id = tencentcloud_security_group.nadhif_sg_be-app-sg.id
  type = "egress"
  port_range = "443" 
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to internet for https request"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_be-app-sg-out-icmp" {
  security_group_id = tencentcloud_security_group.nadhif_sg_be-app-sg.id
  type = "egress"
  ip_protocol = "ICMP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to internet for pinging"
}

# DB traffic
resource "tencentcloud_security_group_rule" "nadhif_sgrule_db-app-sg-in" {
  security_group_id = tencentcloud_security_group.db-sg.id
  type = "ingress"
  port_range = "5432" # postgres db
  ip_protocol = "TCP"
  source_sgid = tencentcloud_security_group.nadhif_sg_be-app-sg.id
  policy = "accept"
  description = "Allow ingress from app sg"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_db-out-tcp" {
  security_group_id = tencentcloud_security_group.db-sg.id
  type = "egress"
  port_range = "443" 
  ip_protocol = "TCP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to internet for https request"
}

resource "tencentcloud_security_group_rule" "nadhif_sgrule_db-out-icmp" {
  security_group_id = tencentcloud_security_group.db-sg.id
  type = "egress"
  ip_protocol = "ICMP"
  cidr_ip = "0.0.0.0/0"
  policy = "accept"
  description = "Allow egress to internet for pinging"
}
