# --- root/variables.tf ---

variable "access_ip" {
  type = string
}

variable "db_name" {
  type = string
}

variable "dbuser" {
  type      = string
  sensitive = true
}

variable "dbpassword" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type = string
  default = "db.t2.micro"
}

variable "db_engine_version" {
  type = string
  default = "5.7"
}

variable "availabilityzone" {
  type = string
  default = "us-east-1a"
}

variable "db_engine" {
  type = string
  default = "mysql"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}