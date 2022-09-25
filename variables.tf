# vpc varibles
variable "region" {
  type = string
}
variable "vpc_cidr" {
    type = string
}
# av_zone1 vars
variable "availability_zone" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "private_subnet_cidr" {
  type = string
}
# av_zone2
variable "availability_zone2" {
  type = string
}
variable "public_subnet_cidr2" {
  type = string
}
variable "private_subnet_cidr2" {
  type = string
}


# ec2(bastion)
variable "network_interface_id" {
  type = string
  default = "network_id_from_aws"
}

# variable "ami" {
#     type = string
#     default = "ami-026b57f3c383c2eec"
# }

variable "instance_type" {
    type = string
    default = "t2.micro"
}

data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}




