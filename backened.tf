terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


   backend "s3" {
     bucket         = "mydev-project-terraform-infra-bucket-1"
     key            = "infra/terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "my-infra-dynamodb-table"
     encrypt        = true
   }
}