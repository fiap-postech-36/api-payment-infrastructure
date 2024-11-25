resource "aws_subnet" "default" {
  vpc_id                  = var.vpcId
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true
}