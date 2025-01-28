resource "aws_ecr_repository" "main" {
  name = var.repo_name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.main.repository_url
}
