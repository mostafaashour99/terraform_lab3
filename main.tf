module "network" {
    source = "/home/mostafa/network"

    region  = var.region
    vpc_cidr = var.vpc_cidr
    # av_zone1
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    availability_zone = var.availability_zone
    # av_zone2
    public_subnet_cidr2 = var.public_subnet_cidr2
    private_subnet_cidr2 = var.private_subnet_cidr2
    availability_zone2 = var.availability_zone2
    
}