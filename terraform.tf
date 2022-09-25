terraform {
  backend "s3" {
    bucket = "terraform-bucket-state01"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    dynamodb_dynamodb_table =  "terraform-state-lock"
  }
}

