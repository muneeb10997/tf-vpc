terraform {
  backend "s3" {
    bucket = "dev-workspace-remote-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}