terraform {
    # Define required providers for Terraform configuration
    required_providers {
        aws = {
            source = "hashicorp/aws"  # AWS provider source
            version = "5.82.2"        # Version of AWS provider
        }
    }
}

provider "aws" {
    # AWS provider configuration
    region     = "ap-south-1"   # Region for AWS resources (Mumbai)
    access_key = "<Your_AWS_Access_Key>"  # AWS Access Key (use environment variables or secrets manager instead)
    secret_key = "<Your_AWS_Secret_Key>"  # AWS Secret Key (use environment variables or secrets manager instead)
}

# First VPC (Defining how we can create more than one VPC as Infrastructure as Code)
resource "aws_vpc" "aks_vpc" { # "aws_vpc" is the provider-resource-type, and "aks_vpc" is the unique resource-type-name
    cidr_block = "10.0.0.0/16"  # CIDR block defining the IP address range for the VPC
    tags = {
        Name = "vpc-1"  # Tag to assign a name to the VPC for easier identification in AWS Console
    }
}

# Second VPC (Creating another VPC with a different CIDR block)
resource "aws_vpc" "vpc_2" {  # "vpc_2" is a unique name for this VPC resource
  cidr_block = "10.1.0.0/16"  # A different CIDR block for the second VPC, ensuring no overlap with the first VPC
  tags = {
    Name = "vpc-2"  # Name tag to identify this VPC in the AWS Console
  }
}

# Third VPC (Defining a third VPC with another unique CIDR block)
resource "aws_vpc" "vpc_3" {  # "vpc_3" is a unique name for the third VPC resource
  cidr_block = "10.2.0.0/16"  # A third CIDR block to ensure unique address space for the VPC
  tags = {
    Name = "vpc-3"  # Name tag to distinguish this VPC from others in the AWS Console
  }
}

