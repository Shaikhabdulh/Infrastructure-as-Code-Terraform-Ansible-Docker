terraform {
  backend "s3" {
    bucket        = "terraform-my-bucket1"
    key           = "devops/terraform.tfstate"
    region        = "us-east-1"
    use_lockfile  = true
  }
}
