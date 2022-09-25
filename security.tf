resource "aws_security_group" "allow_ssh_from_all" {
  name        = "allow_ssh"
  vpc_id      = module.network.vpc_id
  tags = {
    Name = "allow_ssh"
  }
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
     egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}

resource "aws_security_group" "ssh_3000"{
  name        = "allow_ssh_3000"
  vpc_id      = module.network.vpc_id
  ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.vpc_cidr]
    }
  ingress {
    description      = "3000 from VPC only"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
