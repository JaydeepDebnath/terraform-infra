module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = var.private_subnets
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    spot = {
      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
      desired_size   = 2
      max_size       = 3
      min_size       = 1
    }
  }
}
