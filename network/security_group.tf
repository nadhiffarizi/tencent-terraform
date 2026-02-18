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