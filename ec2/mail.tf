provider "aws" {
  region = var.region
}

resource "aws_security_group" "allow_ssh" {
  name = var.sg_name

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  user_data  = file("/home/devops/Desktop/vd-code/ec2/user-data.sh")
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = var.ec2_name
  }
}
