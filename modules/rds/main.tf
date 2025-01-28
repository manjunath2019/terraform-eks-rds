resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot  = true
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}
