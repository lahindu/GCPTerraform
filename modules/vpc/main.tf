# Define VPC
resource "aws_vpc" "vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
        Name                                            = "${var.project}-${var.environment}"
        Environment                                     = var.environment
        "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    }
}

