
resource "aws_eks_cluster" "cluster-created" {
  count = var.create_eks || contains(data.aws_eks_clusters.clusters.names, var.cluster_name) ? 1 : 0
  name     = "${var.cluster_name}-cluster"
  role_arn = data.aws_iam_role.name.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
    security_group_ids      = [var.security_group_id]
    subnet_ids              = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.default_region}e"]
  }

  tags = {
    Name = "${var.cluster_name}-cluster"
  }

  lifecycle {
    ignore_changes = [tags, name]
  }
}


resource "aws_eks_node_group" "node_cluster_group" {
  count = length(aws_eks_cluster.cluster-created) > 0 ? 1 : 0
  cluster_name    = "${var.cluster_name}-cluster"
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = data.aws_iam_role.name.arn
  subnet_ids      = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.default_region}e"]

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 1
  }

  instance_types = ["t2.micro"]
  disk_size      = 50
  ami_type       = "AL2_x86_64"
  depends_on     = [aws_eks_cluster.cluster-created]

  lifecycle {
    create_before_destroy = true
  }
}