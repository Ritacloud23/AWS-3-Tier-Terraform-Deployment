terraform {
  backend "s3" {
    bucket = "penta-ops-storage"
    key    = "tt-aws/production/terraform.tfstate"
    region = "us-east-1"
  }
}