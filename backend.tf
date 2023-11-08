terraform {
  backend "s3" {
    bucket         = "lw-terraform-state-885774"
    key            = "tfstate/project.tfstate"
    encrypt        = false
    region         = "us-east-2"
  }
}
