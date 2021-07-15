
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_availability_zones" "available" {
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.general.project_name}-main-cluster"
  cluster_version = "1.19"
  subnets         = module.vpc.public_subnets

  tags = {
    Environment = "test"
    ClusterName = "radware-terraform-aws-modules"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "${var.general.project_name}-main-cluster-ng-1"
      instance_type                 = var.general.node_instance_type
      asg_desired_capacity          = 3
      additional_security_group_ids = [module.vpc.default_security_group_id]
    }
  ]

  worker_additional_security_group_ids = [module.vpc.default_security_group_id]
  map_users                            = var.users
}