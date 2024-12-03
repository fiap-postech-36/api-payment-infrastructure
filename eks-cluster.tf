resource "aws_eks_cluster" "eks-cluster" {
  name     = "restaurant"
  role_arn = var.labRole
  enabled_cluster_log_types = ["api", "audit"]

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnets.subnets.ids : subnet if subnet != "${var.regionDefault}e"]
    security_group_ids = [aws_security_group.sg-rds.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}
