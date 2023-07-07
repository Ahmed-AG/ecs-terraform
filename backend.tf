terraform {
  backend "s3" {
    bucket         = "terraform-state-1234566"
    key            = "tfstate/project.tfstate"
    encrypt        = false
    region         = "us-east-1"
  }
}
