locals {
  aws_region = "${{ values.aws_region }}"

  rds = {
    name                = "${{ values.rds_name }}"
    allocated_storage   = ${{ values.allocated_storage }}
    storage_type        = "${{ values.storage_type }}"
    engine              = "${{ values.engine }}"
    engine_version      = "${{ values.engine_version }}"
    instance_class      = "${{ values.instance_class }}"
    username            = "${{ secrets.username }}"
    password            = "${{ secrets.password }}"
    skip_final_snapshot = true

    tags = {
      Name      = "${{ values.rds_name }}"
      terraform = "true",
      owner     = "${{ values.owner }}"
    }
  }
}
