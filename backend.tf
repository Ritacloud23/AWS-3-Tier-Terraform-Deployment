terraform {
  backend "s3" {
    bucket = "penta-deployment-bucket"
    key    = "pentaops/prod/terraform.tfstate"
    region = "us-east-1"
  }
}
