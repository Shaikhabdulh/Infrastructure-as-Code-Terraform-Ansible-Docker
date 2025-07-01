terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
        }
  }
  required_version = ">= 1.3"
}

# Default provider (required by Terraform unless overridden)
provider "aws" {
  region  = "us-east-1" # Change to your preferred region; if you update this, ensure that the 'azs' and 'private_subnets' values below are also updated to match the new region's availability zones and valid CIDR ranges.
  profile = "default"   # Optional: if omitted, Terraform uses the default AWS credentials  chain; set if using a named profile from AWS CLI
} 