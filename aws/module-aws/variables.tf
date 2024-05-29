
#Create VPC

variable "region" {
    type = string
    default = "ap-south-1"
}

variable "vpc_name" {
    type = string
    default = "demo"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
    type = string
    default = "10.0.1.0/24"
}


variable "private_subnet_az1_cidr" {
    type = string
    default = "10.0.10.0/24"
}


# Security Group for vpc
variable "security_group_name" {
  type = string
  default = "mysg0001"
}

# EC2
variable "ec2_ami" {
  type = string
  default = "ami-0a7cf821b91bcccbc"
}
variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_name" {
  type = string
  default = "myec2000"
}
variable "key_name" {
    description = "SSH keys to connect to ec2 instance"
    default = "mumbai-region"
}

# Create RDS

variable "allocated_storage" {
  type = string
  default = "20"
}

variable "db_engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.0.28"
}

variable "instance_class" {
  type = string
  default = "db.t2.micro"
}

variable "db_name" {
  type = string
  default = "my_RDS_database"
}

variable "username" {
  type = string
  default = "hiral"
}

variable "password" {
  type = string
  default = "hir123456"
}

variable "skip_final_snapshot" {
  type = bool
  default = "true"
}

variable "db_subnet_group_name" {
  type = string
  default = "rds_database_subnet"
}

variable "subnet_group_tag" {
  type = string
  default = "rds_databse_saabnet"
}

#S3 Bucket
variable "bucket_name" {  
  type        = string  
  default = "shahhir.ga"
} 

variable "bucket_tag" {  
  type        = string  
  default = "shahhir.ga"
} 


