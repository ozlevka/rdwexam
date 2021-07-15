

module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  name = "radware-cluster"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "radware"
  }
}



resource "aws_security_group_rule" "common_ingress_sg_rule" {
    count    = length(var.sg_ingress_networks)
    type     = "ingress"
    from_port   = var.sg_ingress_networks[count.index].from_port
    to_port     = var.sg_ingress_networks[count.index].to_port
    protocol    = var.sg_ingress_networks[count.index].protocol
    description = var.sg_ingress_networks[count.index].description
    cidr_blocks = var.sg_ingress_networks[count.index].cidr_blocks
    security_group_id = module.vpc.default_security_group_id
}