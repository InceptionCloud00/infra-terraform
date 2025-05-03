terraform {
  backend "s3" {
    bucket         = "inception-cloud-00-terrform-state-prod"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "inception-cloud-00-terrform-lock-prod"
    encrypt        = true
  }
}
