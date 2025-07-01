provider "aws" {
  region  = "eu-west-1" # Change to your preferred region
  profile = "default"   # Optional, if using a named profile from AWS CLI
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "11.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}