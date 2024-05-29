#variable "ec2_ami" {}
#variable "ec2_type" {t2.micro}
#variable "subnet_id" {subnet-03599301a3c571501}
##variable "ec2_name" {mumbai-region}
#variable "ec2_security_group_id" {sg-03246e55de6e866f1}
#variable "key_name" {mumbai-region}
#variable "key_name" {}

# EC2
variable "region" {
    type = string
    default = "ap-south-1"
}
variable "ec2_ami" {
  type = string
  default = "ami-0a7cf821b91bcccbc"
}
variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_name" {
  type = string
  default = "tera-ec2-demo"
}
variable "key_name" {
    description = "SSH keys to connect to ec2 instance"
    default = "mumbai-region"
}
variable "subnet_id" {
    default= "subnet-03599301a3c571501"
}
variable "vpc_security_group_ids" {
    default= "sg-03246e55de6e866f1"
}