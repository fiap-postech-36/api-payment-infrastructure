module "vpc" {
  source = "github.com/fiap-postech-36/vpc-infrastructure?ref=v1.0.0"

  name                 = var.projectName
  vpc_cidr             = "18.0.0.0/16"
  public_subnet_cidrs  = ["18.0.6.0/24", "18.0.7.0/24"]
  private_subnet_cidrs = ["18.0.8.0/24", "18.0.9.0/24"]
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
}