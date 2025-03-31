# ${{ values.vpc_name }}

このComponentは、VPC `${{ values.vpc_name }}`上に作成されたRDSを管理しています。

## RDS情報（Template実行時）
* RDS名: ${{ values.rds_name }}
* VPC名: ${{ values.vpc_name }}
* リージョン: ${{ values.aws_region }}
* ストレージのサイズ(GB): ${{ values.allocated_storage }}
* ストレージタイプ: ${{ values.storage_type }}
* データベースエンジン: ${{ values.engine }}
* エンジンのバージョン: ${{ values.engine_version }}
* インスタンスクラス: ${{ values.instance_class }}

