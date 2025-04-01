provider "aws" {
  region = "${{ "${{" }} secrets.AWS_REGION }}"
}

terraform {
  backend "s3" {
    bucket = "rhdh-practice-tfstate"
    key    = "${{ values.rds_name }}/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "${{ values.vpc_name }}" {
  backend = "s3"
  config = {
    bucket = "rhdh-practice-tfstate"
    key    = "${{ values.vpc_name }}/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
