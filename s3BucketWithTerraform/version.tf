# Define the required AWS provider version for the project
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"  # AWS provider source
        version = "5.82.2"        # Specify the version of the AWS provider
    }
  }
}

# Configure the AWS provider with necessary access credentials and region
provider "aws" {
  region     = "ap-south-1"  # AWS region where resources will be created (Mumbai)
  access_key = "<Your_AWS_Access_Key>"  # AWS Access Key for authentication
  secret_key = "<Your_AWS_Secret_Key>"  # AWS Secret Key for authentication
}
