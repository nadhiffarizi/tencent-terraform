variable "app_id" {
    type = string
    description = "app_id"
}

variable "owner_uin" {
    type = string
    description = "owner uin"
}

variable "cos_priv_bucket" {
    type = string
    description = "cos private bucket to attach to destination service"
}

variable "cvm_id" {
    type = string
    description = "cvm instance id to attach to the role"
}