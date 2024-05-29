#variable "subnet_id" {}
#variable "db_subnet_group_name" {}
#variable "subnet_id_az1" {}
#variable "subnet_group_tag" {}
#variable "allocated_storage" {}
#variable "engine" {}
#variable "engine_version" {}
#variable "instance_class" {}
#variable "db_name" {}
#variable "username" {}
#variable "password" {}
#variable "skip_final_snapshot" {}


variable "region" {
    type = string
    default = "ap-south-1"
}
#ariable "subnet_id" {
#    type = string
 #   default = "subnet-094f7e6c40eb293b8"
#}
variable "db_subnet_group_name" {
    type = string
    default = "ap-south-sbnt"
}

variable "subnet_id_az1" {
    type = string
    default = "subnet-03599301a3c571501"
}

variable "allocated_storage" {
    type = string
    default = "10"
}

variable "engine_version" {
    type = string
    default = "14"
}

variable "instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "db_name" {
    type = string
    default = "ap-south-db-1"
}

variable "username" {
    type = string
    default = "use"
}

variable "password" {
    type = string
    default = "user@123"
}

variable "skip_final_snapshot" {
    type = bool
    default = true
}

variable "engine" {
    type = string
    default = "postgres"
}

variable "subnet_group_tag" {
    type = string
    default = "ap-south-sbnt-tag1"
}
