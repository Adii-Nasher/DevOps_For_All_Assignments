# Terraform AWS VPC Deployment
This Terraform configuration defines the creation of three VPCs in AWS using the AWS provider. Each VPC is configured with unique CIDR blocks to ensure there is no overlap in IP address space.

## Prerequisites
Before running the Terraform configuration, ensure the following:

* You have `Terraform` installed on your system.
* You have an `AWS account` with appropriate permissions to create VPCs.
* You have your `AWS Access Key` and `AWS Secret Key` ready for authentication.

## Directory Structure
The directory structure should look like this:

```bash
└── vpcWithTerraform
    ├── README.md # This file
    └── version.tf # Terraform configuration file defining the VPCs
```    

## Steps to Provision the VPCs
Follow these steps to deploy the infrastructure using Terraform:

1. Install Terraform - 
If you haven't already installed Terraform, follow the instructions from the official Terraform documentation: Installing Terraform.

2. Set Up AWS Authentication - 
To authenticate with AWS, Terraform uses AWS credentials. You can provide these credentials in the following ways:

### Using AWS environment variables:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY

You can set these variables in your terminal (bash, zsh, etc.):

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
```

3. Initialize the Terraform Project -
Navigate to the directory where the main.tf file is located. Run the following command to initialize the Terraform project and download the required provider:

```bash
terraform init
```
This command installs the AWS provider (version 5.82.2 as specified) and initializes the working directory for Terraform.

4. Review the Plan -
After initialization, you should run terraform plan to see what changes Terraform will make to your AWS environment:

```bash
terraform plan
```
This command shows a detailed execution plan and outlines the resources that Terraform will create, update, or destroy. It gives you an opportunity to review the changes before actually applying them.

5. Apply the Plan - 
Once you've reviewed the plan and are ready to provision the resources, apply the configuration with:

```bash
terraform apply
```
Terraform will ask you to confirm by typing yes. After you confirm, Terraform will create the three VPCs in AWS according to the configuration defined in `version.tf`.

6. Verify the Resources -
After the terraform apply command completes successfully, go to the AWS Console and navigate to the VPC section to verify that the following three VPCs have been created:

* vpc-1 with CIDR block 10.0.0.0/16
* vpc-2 with CIDR block 10.1.0.0/16
* vpc-3 with CIDR block 10.2.0.0/16

7. Clean Up the Resources (Optional) - 
To delete the resources provisioned by Terraform, you can run:

```bash
terraform destroy
```
This command will remove all the resources that Terraform created based on the current configuration. It will prompt you for confirmation before making any changes.