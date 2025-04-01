locals {
  rds = {
    identifier          = "${{ values.rds_name }}"
    db_name             = "${{ values.db_name }}"
    allocated_storage   = ${{ values.allocated_storage }}
    storage_type        = "${{ values.storage_type }}"
    engine              = "${{ values.engine }}"
    engine_version      = "${{ values.engine_version }}"
    instance_class      = "${{ values.instance_class }}"
    multi_az            = ${{ values.multi_az }}
    skip_final_snapshot = true

    tags = {
      Name      = "${{ values.rds_name }}"
      terraform = "true",
      owner     = "${{ values.owner }}"
    }
  }
}
