output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_endpoint" {
  value = module.eks.cluster_endpoint
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "ecr_url" {
  value = module.ecr.ecr_repo_url
}
