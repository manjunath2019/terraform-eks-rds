provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.vpc_cidr
  subnet_cidrs       = var.subnet_cidrs
  availability_zones = var.availability_zones
  vpc_name           = "my-vpc"
}

module "eks" {
  source           = "./modules/eks"
  cluster_name     = var.eks_cluster_name
  subnet_ids       = module.vpc.subnet_ids
  desired_size     = var.eks_desired_capacity
  min_size         = var.eks_min_capacity
  max_size         = var.eks_max_capacity
  cluster_role_arn = "<EKS Cluster Role ARN>"
  node_role_arn    = "<EKS Node Role ARN>"
}

module "rds" {
  source             = "./modules/rds"
  allocated_storage  = 20
  engine             = var.rds_engine
  engine_version     = var.rds_engine_version
  instance_class     = var.rds_instance_class
  db_name            = var.rds_db_name
  username           = var.rds_username
  password           = var.rds_password
  security_group_ids = ["<Security Group ID>"]
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = var.ecr_repo_name
}
