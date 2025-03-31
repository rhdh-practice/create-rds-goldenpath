data "aws_caller_identity" "current" {}

resource "aws_db_instance" "${{ values.rds_name }}" {
  allocated_storage   = local.rds.values.allocated_storage
  storage_type        = local.rds.values.storage_type
  engine              = local.rds.engine
  engine_version      = local.rds.engine_version
  instance_class      = local.rds.instance_class
  name                = local.rds.db_name
  username            = local.rds.username
  password            = local.rds.password
  skip_final_snapshot = local.rds.skip_final_snapshot

  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  publicly_accessible    = true

  tags = local.rds.tags
}

resource "aws_security_group" "db" {
  vpc_id = data.terraform_remote_state.${{ values.vpc_name }}.vpc_id

  tags = {
    Name = "${local.rds.name}-sg"
  }
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.db.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "${local.rds.name}-subnet-group"
  subnet_ids = data.terraform_remote_state.${{ values.vpc_name }}.public_subnets

  tags = {
    Name = "${local.rds.name}-subnet-group"
  }
}
