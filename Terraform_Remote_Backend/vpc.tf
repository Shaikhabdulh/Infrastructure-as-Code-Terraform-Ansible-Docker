
provider "aws" {
  alias   = "vpc"
  region  = "us-east-1"
  profile = "default"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.vpc
  }

  name            = "my-vpc"
  cidr            = "11.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
