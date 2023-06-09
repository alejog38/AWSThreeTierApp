# --- networking/variables.tf ---

variable "vpc_cidr" {
  type = string
}

variable "public_sn_count" {
  type = number
}

variable "private_sn_count" {
  type = number
}

variable "access_ip" {
  type = string
}

variable "db_subnet_group" {
  type = bool
}

variable "map_public_ip_on_launch"{
  type = bool
  default = true  
}

variable "availabilityzone" {}

variable "azs" {}