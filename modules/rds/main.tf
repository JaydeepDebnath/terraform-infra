resource "aws_db_instance" "this" {
  identifier        = var.db_name
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username = var.username
  password = var.password

  skip_final_snapshot = true
  publicly_accessible = false

  vpc_security_group_ids = [var.sg_id]
  db_subnet_group_name   = var.subnet_group
}
